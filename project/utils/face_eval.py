from facenet_pytorch import MTCNN, InceptionResnetV1


def compute_average_similarity(
    face_detector, face_similarity, generated_image, reference_image
) -> float:
    generated_face = face_detector(generated_image)

    if generated_face == None:
        return 0.0
    generated_face = generated_face[:1]

    reference_face = face_detector(reference_image)[:1]
    assert len(reference_face) == 1, "no reference face detected in reference image"

    generated_face = generated_face.to(face_detector.device).reshape(1, 3, 160, 160)
    reference_face = reference_face.to(face_detector.device).reshape(1, 3, 160, 160)

    similarity = face_similarity(generated_face) @ face_similarity(reference_face).T
    return max(similarity.item(), 0.0)


def calculate_identity_similarity(
        device,
        generated_image,
        ref_image,
        image_size=160,
        margin=0,
        min_face_size=20,
        thresholds=[0.6, 0.7, 0.7],
        factor=0.709,
        post_process=True,
        keep_all=True,
):
    
    face_detector = MTCNN(
        image_size=image_size,
        margin=margin,
        min_face_size=min_face_size,
        thresholds=thresholds,
        factor=factor,
        post_process=post_process,
        device=device,
        keep_all=keep_all,
    )

    face_similarity = (
        InceptionResnetV1(pretrained="vggface2").eval().to(device)
    )

    identity_similarity = compute_average_similarity(face_detector, face_similarity, generated_image, ref_image)

    return identity_similarity