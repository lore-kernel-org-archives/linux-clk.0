Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2943E3ECBED
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338139; cv=none; b=Kbd5fq/R/Hb0zXydfx4DGrju8dmYHiDLi6F6CTdJS2a/rCRRS06/ZVTBen03zYlKANcLcFUl0o6MuHEx2cX5AGwjRQZEmPBFB7ZCH0Fp61wHy9bd/mr8zI41QcOpwI7lIJT/gLqamcLzg0174mJbyvfVIDvttPr/H3aJVPCj2GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338139; c=relaxed/simple;
	bh=Q5+uO3LW2fHz7K6MzYEBqR1TRxqTCEKCt8vYU5DOE7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxWrXEpEQJnOAJjd74Wd/L/wiFxFdrI+IIM7l8tjI7yCorkPvZMNloSuN3pkhIybUMEMpooUHSpwiUfrKSVHhECt23b8YojblKrpDaT5VUkHuAUQkVDavJr5aTYV34WjqZbGy4y0I6EY66J1eJmWqZG31q3x0GyUFw3K2B3lb/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPutK4Ew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Usb0qWgL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPutK4Ew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Usb0qWgL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EnNPn1214156
	for <linux-clk@vger.kernel.org>; Mon, 1 Jun 2026 18:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=; b=VPutK4EwGWBOC/1P
	Gxnx8nADNhUoAtR680pKn0CiL4wAGgSDmNjWsxYgiPzxm/rOkHbWoYsjldlv9afC
	N8scls1rIwR1tg0VnS9DZvLgnKcd/MMZBMxxQ81ZCmnOP3/3Xy/Z/LDjYnMdjiMK
	dLmDGxVb8WyXCdIOb6hEuvbvsmdJZLAgjSdNoNsub10kOSxKxZDbF8OAy1Twp+tA
	BR/xkLY1cWyQgITZ6of9u6kuxYRRd2AoOcafX2L1zvPzXr1wS1AIRlVCmp9XPTCp
	fLS+WECK6KJjR3YcFi5bcVj3jY5trPP2j4xayJ1cMz2By5CEfV2hlA3Vk4uas/RU
	LzCVBg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s9afs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 18:22:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso2061994a12.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Jun 2026 11:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338137; x=1780942937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=;
        b=Usb0qWgLPg+vjn4VzUz7k56VOiRsIKrgtZZOZo0dws+YWfTxxi/GDxtyITpC7xWLpV
         VBtRaULVhbTvz+PbfpqOamNzoKq96Gj2m0eIwmzBBYtxjHISjGxIKMJR+N3pg8cAB+pF
         HV1cd+4ZwYfxlQu5l39kqTIQEMpcHK/MNIHLCliysy7c6NVoYH6th1ctvRzl2V14cYIq
         d/OiX65nzYYCafGfa4vsJRzTOJc2olTSJRX4SSS56D9AFMImFi/GzWI59vKbK/Ykn7Ht
         F6DGPizz9pfUCjl2JYZSbUlm9GnfeASwdaIM6Cagc0XM+r6zrtZPOrVL97fiVOvhATBE
         9Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338137; x=1780942937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o7xunX9AoaOwWCMQKY0XEljtxPH3cBbeVh85YvfYixU=;
        b=HceVU5kocvOvryFwoY2h6FDYFVejg+Vqs95GwLYQ8aNngqpOKK7zIkG5Qg7O76A85T
         67sYSeCnv1EJaeA3VIPCYfyxCId0AOH5ezWShELdXUk5tj+tidKquxmd1Ff1nlv9H+gD
         O0Y6+/gBcfFX6aeZDhdFSh6JngzN1pYMdthqEW4oIpblq2eLI/43H2Mm6hkRyzLSZnok
         Ntu1k4baEVzfwheqV1R6LkChu00BAPqnMRA+IKB6qZ+CP3lv3ep6Wc0BLA6472tlVwiz
         BdKNbk0mlg7lpXnZhajA2jCU0uym2HtiXUOQLvGpDG/AbmNIbTwxjYuNdki/kRriPqyP
         pGFg==
X-Forwarded-Encrypted: i=1; AFNElJ8/Fby1DIpxxnSZd6mcDQzRONEFFbXru53Lh1uEcZyuzfg2g3Na+lgLCSsDoCG+X+lHuMLI00sDa00=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHgFW/pA7hi5DRAC23939W+SV9McZGqVRUEW14orCeGkg5hMel
	Nv8VxMFAJMt/14+oKebEwKF/UqG0E44XTSCLCLXiBoXVGIBBhgwNpktk4WORfktQ8uoOgaFUaZU
	HO8c2keiw4d4rrP/Tu1KkA2KqV7amn5EKytx3QGakGbvteEiqMuGZysKW5+3NOCo=
X-Gm-Gg: Acq92OHUL85vrkz9UFlWx1niYNy+jW38ZYGWOND3PSI7qcOe/P9rnMbtEJ6Q1CZpLlg
	ZtZdWmp5Kiq4b/SRAFMes0M0K/EdizbRMq8cH2W+mMrj3+Cgm2OhTqSkYDJ4XsM/TJShvgWQyYA
	lqMQdN1v7Gb/GDTg5UGTDlnTWZHwMHOF5gPCBfvzQDorutaUhYcuEWnm5TONUj3OhwIjfNwqwtd
	ZyIQhZYlcnjU91weCzNw+Csf4QBsGu/sHXBO77ojqsGvtRc4qc/HnHjWlK/xG4AYgN8A1hv8jj4
	DQkPuhfsrMeFnSUdo3ICNYOGSL6mrlSS2owdaOccyk10557VPJW4ce1hDJJ8Ry4SLD5JvOLchGK
	a9Eol/mK5uL34C31v5XTIvZ30pzL8Sx+Hlj1ejI/wCFOg9G1Uf+5oeiQ1FGQhS2Y=
X-Received: by 2002:a17:90b:578c:b0:36b:aed6:235a with SMTP id 98e67ed59e1d1-36c67facb44mr11979508a91.22.1780338136829;
        Mon, 01 Jun 2026 11:22:16 -0700 (PDT)
X-Received: by 2002:a17:90b:578c:b0:36b:aed6:235a with SMTP id 98e67ed59e1d1-36c67facb44mr11979487a91.22.1780338136402;
        Mon, 01 Jun 2026 11:22:16 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:16 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:25 +0530
Subject: [PATCH v3 03/12] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-3-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: gRKzA-OBP86hkypB5ISHrD7vyfgZ-2KV
X-Proofpoint-GUID: gRKzA-OBP86hkypB5ISHrD7vyfgZ-2KV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX2MUDDDM9EU/D
 kgc5ApaUIBEOsywp1BhvXeFjJJhVfXZcXIAYNak1lZjCY5kQY0nHH9iS3kJd+Em8EOkm2KmWBt9
 q/9GC5EvYORxJLFawkwr8NeBEeaxbMFjqYD6v6FZA+3+X3YLaUSgxmFrpRXfYSZwxtTJKNWfL4I
 42VwyhlsFb8BEXi23mysNQigrkgdOAicht1ikClBKL7f9YbvSq3LMgQO9zGkaanJcQ1XVS+Ssne
 1uh+kt6pZ9h/nQFHvSzHkce8OAYQIYZdifKXLyQojW6F7eEMHl8adoXNmUPoqhe3NpHZyg0Kd7r
 rfOtRuNi3lEmOU/U+UCsPjpgPl6aAzl1M5uutO2BpUDjdpvhzYxagMJ2VNE3ISdULOXa1tnnHxy
 PVe+PQzT3eackjGwlUzxJ0IbmIviNsxYLqlAcgCSNxbyRsKWN120yM0wBCQGWalqMuWXQrbd7rP
 Cqr1OHrmZbapLK7ZRyQ==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1dcdd9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

The Qualcomm Shikra Display clock controller is similar to QCM2290
DISPCC hardware block. Hence, reuse the QCM2290 DISPCC bindings for
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 24f2cce033f6e109b65a79553fba5295eb9adf3a..5cee033f2115deb392fc1deeee8d5aed4cbde052 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -17,7 +17,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-dispcc
+    oneOf:
+      - items:
+          - enum:
+              - qcom,shikra-dispcc
+          - const: qcom,qcm2290-dispcc
+      - enum:
+          - qcom,qcm2290-dispcc
 
   clocks:
     items:

-- 
2.34.1

