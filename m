Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11623432E96
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176970; cv=none; b=udG8T4oFYAdmFfbH7XezQ9CByYFrOybwHKdQat1I2lVA94RXMa5yZLwmBpgHZWKFwKbg6/4QKlvbXNFTcaBaS4FCFhW9RlKXt5xP6sK3gfcDZm8kIPu1DC9bpM/wlIDo+JkYW/m2t+xffrtEfFDYJ4J4STSPN8GFtaGsuhVEvLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176970; c=relaxed/simple;
	bh=JwCLR9iFFFFuRnYMfZ24S/lkYDC1+Mq6uVmbgytz5J4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b5uG1TFG1yYE4Q6BbEahuV5P/IAxBDwi5RRfU0QU30/EDGvswLzL9zRQztVkbvoIszQruqLe8KffjjSfMudWZVG108SvX3WjZ3BqfukjXf0hgXQfFnWxeTK+YhSOP2kSjyVQPaEKNBI4ZE3ZY5zW3ghJFUEwAfHZO8NeADwRsYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIP6F6Uo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLCH2zXb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIP6F6Uo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLCH2zXb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC1ja4028793
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s7rXRbvXwU7+wfekH6skCa
	5uexonXhISDvr9zJy5MwI=; b=GIP6F6Uo6d9hSobkFne6b5FPiO5v8fJjRNTYFU
	KMCBYZ9WMJwz58geoDhZ0Rzy+ZGXM1TGmelXfNAHWWSobM36tsiiYCeZFxh6QtwM
	nRWwD8W6TDXZksptgcVHhmrx6SXsgBRO4NZvpOeFwu888zXnmr7Vfj+2IJH1+bfp
	LR02BdBsiNMCAPgQgzK5FExQ+1vPyETCRX8aT8PXtNjvkWxhmwYVUWDNdpsxBD0w
	ivdVcpHxg80xmNtTJhyUTLajy8t7MafDMCJMG3DpSxuenwZ3aLVqFTVc49HG6quV
	6Sn7jzVdPTV8k8ENL3O5bVTzFKfVfIzm09UUCfGUTpCU4fgQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v6aat7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:29:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso3740204a12.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785176967; x=1785781767; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s7rXRbvXwU7+wfekH6skCa5uexonXhISDvr9zJy5MwI=;
        b=FLCH2zXbyFkA/tf3Y6mAvMzj+lQk4CXvGJcD4VxbV1X4qUifF4NbU+9bFWDyfkGgIZ
         oMdKzsJzacBrCGE2xHiEyOJMmv/Fn1/LHCeybZiSU387pmEuwSXq/Qf822CaYt1N0nSa
         cemkKXR/joH1+JpfkL6Dail9hHzDSlp1IBehcIJ1ugYTw6po9/zkwojDsIrdx9dW9Pi1
         N4yptVWQHWyO+n2n501A4unT5y/6jrHrb3R+Xdqo0nERcVHQdP+a45BdCtzSRJ69r5xW
         2Cb9aFfUsDiYV/pT/+nkT3NaMwhLzwTkHH4bjai11LutwRgWwGLmBTF7/QdF7+gEA2kr
         d8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176967; x=1785781767;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s7rXRbvXwU7+wfekH6skCa5uexonXhISDvr9zJy5MwI=;
        b=MgfILKfMIP+8acR3WCZe025askYeqajUXky3adkuHuKaR4iML8CytZKf8cIfkfmhVR
         3D2/+fbz8437yZi1FNdKrA12dEfdr4xg2iHncQTYvgEWbKZUirjSZH3oL++a9FFgd+rL
         ha4hwwpDtyERSo1uvgK08a16nMpI6+hL6cUk7VJ9afos7uofRUdBJgGPHZqg+RfKe8MY
         G1MiB6sqwdz9ybhNriDecr/3dd+dfHZlUu7NY6IErccW3dqZ/4F/l+lzg8/mAhCn++/c
         tr/T7RpORH+vk5aV77NOH0CR2+El2HVSv+pcfSa0aYtGJi2s/u+F88hYXtR462+08fnZ
         naGA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1Aa+5XYTeSBYuLZSQYE/KIu+U+OmzfCSNbPiqjFKbNYVlEoQQ+s9QUmcfdqQJhqYTTkFhrYe6xlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIJD92TJG9C2lTdb4ELX2oULiyrGYVlFd62i6P1D/qQSCOzCe
	hraDjPSbmJWZBw43dBwOdm6a4G9OpwhS9mDizCoGWkro8nVP4MgRIUQhe3GPShWnAMT4mSIbhSj
	AnoB5gidP6JeNfZ9Shv+j9VqGNFbB54mVUw1827UcYc2lK9F+rwCjw7B24HD68Kw=
X-Gm-Gg: AR+sD10WovXcgPyaKWQUzrt6PI3MEBP7v2+Y49J+LniGjhpMjaHaiGwNrDdwWLu3PPZ
	J4GtDe4q+X5WvfTFLkuNRqwYPtaZ2NxNCJyYDzkiJilmWlBU7M5/njsv2N+SeCmF1jQHB8IN2NL
	qNNZuFg3/Y8jXiKvlD27zQLxskuu3C9pH55ZUrhkA6ILVD13ExumHh8WAGHApDZtW/p9E9397ij
	rdMNzTmyCsqFhe0WMtn+ZWDtaHVIEBkXyCz2rzTXwW4AzAyY8VobokCHAbo53Lc/DKMdz3Cj81l
	lW7PtJm2lo4L/nCJerYfwZaxljp5w76QpLWFTKXChqmozGXfeZyQbQg5LmrKKveUYQl+6t+m7Mo
	VkP9bpKp2XGkm/1ggaVmzdBzDQ9sWJc8=
X-Received: by 2002:a05:6a21:3418:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c6c80438d5mr740526637.51.1785176966515;
        Mon, 27 Jul 2026 11:29:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:3418:b0:3bf:b931:b3f4 with SMTP id adf61e73a8af0-3c6c80438d5mr740472637.51.1785176965916;
        Mon, 27 Jul 2026 11:29:25 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a04b2sm31963087eec.28.2026.07.27.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:29:25 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add camera clock controllers support for
 Qualcomm Maili SoC
Date: Mon, 27 Jul 2026 23:59:08 +0530
Message-Id: <20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSjZ2oC/02OW07DMBBFtxL5G0uOH7HjraCq8ozHdEQeJQkBq
 ereMQ0IPs+VztG9iZUWplXE5iYW2nnlearQPjUCL2l6Icm5stBKd8prL8fEA58xjYiSbMkeewu
 uR1GN60KFPx+159PBC7291+h2jH/N2DyKXftb5Ik3TsMZhxlfJXrSYJ1ROai4G/H/zo/qVJDHj
 Uv6YGmBQvBkgMDFvf02IK0kcR5H3mJjA6WsvTWQVDE6lOCwvneA2jloS0d9h7kHcbrfvwD/99B
 UFgEAAA==
X-Change-ID: 20260727-maili_camcc-e4fd7c94b59c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfX7IiAhCRfNuKx
 TRTzOesjXyYarB89grvaPb2qpU3X2oXsP/R8J2zhDmY8tevapZdYXlJyzJ0YtepeYvLlEmNQEK5
 GlZZ3L0DZdMVXmcKsWKh5qYFu9mb/3k=
X-Proofpoint-GUID: nfyPCE6yYGHJPTt0wrGt2a4qFTcNi9Zp
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a67a387 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fMwyTfTMBRYe1uhAUZ8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: nfyPCE6yYGHJPTt0wrGt2a4qFTcNi9Zp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3MCBTYWx0ZWRfX5Zxcsd4YxAXM
 nzgZJQRJxFphLTGnPFieNxDOUiDj+HcUCHn7NJuBJDFRZsvjJqRiehzWIYR84f1SeupEPAqWUrV
 mPQ7bltRUCb423SxOTzPW8iaffy5dYgnJvrjE0eiQdi7ZND7oEZoPKa6uugLurrujaTWQ2dgBsn
 J+rNyERxMuvuexHdYz3FrVOSnUV2vi8Ywh6j3vL+dbP5C3pU+1gso2gOPin+YPcnUGreVnUfn5N
 t1OpFt7KV6nV5P1So8BQzwmv9wYGNGP4w0arnSyVOqK/8g2Tf8Zu9IlY0Fzqc9ioB2f5hHdwzGO
 aSDG+c/QknCkPWBM+hEuZZ/3mxCPMfTZbg9sjrwSg0iKk2Uukd6qunfQ0DmUyZ4rVKpggtP2Wlx
 RANb2tZDrtP2BTn+CSSf5Oe3jRHS0VGEX4zgHgImNnx6OqY6ECRhNSYtWDsAyz0p7FJBDLfGbx1
 ZOWd2/9Ufx/51X9qvaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270170

This series adds support for the camera clock controllers on the upcoming
Qualcomm Maili SoC.

This series is dependent on Maili gcc[1] and Hawi camcc[2] clock series
[1]: https://lore.kernel.org/all/20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260723-camcc-hawi-v1-0-7057658c5c47@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili camera clock controllers
      clk: qcom: Add support for camera clock controller on Maili

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   2 +
 drivers/clk/qcom/camcc-hawi.c                      | 158 +++++++++++++++++++++
 2 files changed, 160 insertions(+)
---
base-commit: 48ead2743ba0f328f85cfd75bc255b1f6e96cd9b
change-id: 20260727-maili_camcc-e4fd7c94b59c
prerequisite-change-id: 20260617-maili_initial_clock-c7e2b4530d80:v3
prerequisite-patch-id: cb2499a822715bf6d411ea000e525e5feab52e7f
prerequisite-patch-id: 4280283ee9f782a5ba46e4419ab0b7186add0211
prerequisite-patch-id: 3e9a75794efb1633818ffe387d1f4e5048c361a4
prerequisite-patch-id: 4b5fc2ccabb6be0eef59a9a223a228bb1ecba981
prerequisite-patch-id: 7e5ac7db1fba3258b45b689b11d0ca93d65aa38a
prerequisite-change-id: 20260508-camcc-hawi-4be887e3beb5:v1
prerequisite-patch-id: 9fbee6bee0a3235a188c9380c8d7574f5a4774c2
prerequisite-patch-id: 38b41881b46403d8f8ec68b5eb12654d854995e6

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

