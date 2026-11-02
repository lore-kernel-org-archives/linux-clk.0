Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620144;
	b=sBrnuDnpw8Ss22fFj2RAO4IMk7xycpjdQyqmRKEaV/X3D52nmCoFkCgW8YbNJRDfNjus
	 mA5GSXo5LeVIBKCYFh4RHQTC7b5Ww6VKnue1ui21MBlYN5/GdVJyL49J+rRE2WpZg1uQU
	 FKrv/WUIpcOlq/HTOYeCz86ya7clCcYU/0yW90kBpQjFZlHN2pxWVT/b6WPWEmXG16Kjz
	 mirxRSR1kNLWZ1Ot5gU1gs5zbzbUuUAx9ZfqBI1u/QN9kyJfUUkcdEucsQKYShVr3zcQl
	 wo0lOXJSan7XgbAyx+x0/t2TSdnKIW0WiptkGg8TPeAlR3awd4/jPXDQbovq2zj78Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=;
	b=qWDM17HLs32H9Ebb12patBRQpWjbFbx8TKqjYZArqSCCuYQ5VwWeKRq9tZjo5MmYJKaL
	 iX+Vc/vFKz7mdXszTDePwxKgxWZCTGrKfv4vcEKZMlDLEUD6mftLe+UQnryaA1QOrq5PY
	 KiIJQOwc80r3EpR6e2zwMJTY5dIOtpV4qWyuTOlYQ57++ScAQjFqCvT27oQsqzNcbI3V3
	 GJpk+UgRj3fDHdgRAmjKBfa/wjD27l+UU+6SVDYs+356zfvDtGcF3crI4mB+Lbyb2KP7+
	 gOoZBp5uh4tr/F4iMi4xFFG/Ng10yezWhxFr+8UW4SM40hWcaUG4cVoFGth+q6UF4eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="RtCLC0/X";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z3AkL8/z";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0F606A329
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 11:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D0F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtCLC0/X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z3AkL8/z
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xsg3402423
	for <linux-clk@vger.kernel.org>; Mon, 2 Nov 2026 11:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4mhjs5YiwohXXKlFzT3X2w
	nGvKV4qOEdncy1Sbc0n2k=; b=RtCLC0/XXANm8zGgprXI3f3T37+VgrKFe5r46H
	2ljNLkoK2gazwDz7NG4AxsRSq0qth/tadAd4VDsMojwF2pGSEUNKi9wNX3hhGRlO
	yCNISqG4tjDTkry06+9GHllYka1MBnhc2Z/Kg2sXl330PxZx0QCmUB0f0SBNKIkl
	dFqhKQrm3GqGFBcrJMheFJx6PskKYLsq0gCymF6MS/+/Yc2qpsPErNsWmaVfvbMS
	yKX6Ur3QsNaNjAdqW9jrufv1R55hkFZBEjzALI5VDh9QYFShvR7lOLvNoXcFRyVK
	PXchsimmg9hLnqm2ZHsBtfmty7dCie4HQ14+KZ63xjIJk/Kg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8x7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 11:49:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so606122985a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 03:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620142; x=1794224942; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=;
        b=Z3AkL8/zzrUU8kYkrZYylUCn/QgmTsbJtl9Aq6Fgujcd/k6TzRX3xhPZpbvkn15iGy
         sYl5/D6WsNYrqYL71KLHjVhUL4NHGJ3AcdEuxos1bjcd5vihFev9TjmzwG8oZWJqfwU9
         uP156tnvh9j0HiYhwHzffFTQ1VzHFIm6aTIt//LKWxRydy9LS0NaFVJEpTUlnqd8620+
         hQh94n35X9ERPZIwQpZeJiAaKfMkVJe8wl5lNjymQX+mriDoQEod6QeL+VWtt2ZoUHQX
         juTk1hgbo3aQGjL2MSm9OWcP8EaSt4L3hSa/a8gYIIu2GPnoUexw0p6Fz9HPkfIh6u6B
         0NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620142; x=1794224942;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=;
        b=c6e/CnOIW8HSkjevL+ijbSP48HjHTugKPgJIoVA0Lx7jfsiL/CbZUkHO/QVQF+ljDU
         mvwc0Ev1LmXYWQpHbQqZKCGBDYhWA1KRgXMBr/rzRROsUL66ZB7S6c3x9ZKTkvwt808C
         8iVsd7OFyU393+vEG/hBvkrdWL9w5MKLx1ugBXVBL4n/EwcvCfHeLua8jv6SBjEjNjgn
         HMqAlQfETpFWQbZjp6cJENT5EPiE72OLpZ1ZCznnevsV1Uz3BCayw3jjQ4oEOHXYsJkz
         +TJ7usg81T7CXowvaC6OwFB/DNhO6XA0m2YaQVsx0gKKrhsHRY99eM5oqAt7dbAKKcAp
         6Xcw==
X-Gm-Message-State: AFq9FYJm6JUmPT4waIlDpLp3g+mGRoSEBWYstN6ilelV0LtDsbvg67uf
	E367jpMg9IhKjYxN/BpMK/tNROcpGkFLSyi82th55FWUdySDkUMOHedbs1En+LckaruN1oQuTdV
	5JVLno/j8Q45flGIXS6e3tTzZ7gwMin3mGSW/YExs5yCYY3+h9wQQGNkDNJffUMI=
X-Gm-Gg: AYBFou3GL9EAVNsYtaNG+yUx3/+JAFxAxWE+a2Pv2W0cRBBMH2GZkFy39GDEPvcj3vc
	IxJerLwejmflUaqclwMPuFBO3cpdR0bphHcUN3wNdxtmAEHDBlls++ul7Z1QP6R3j1fWjfqjeYq
	St0GeleqTGp5A2ESkcGvdr0JKSlAdEBCVHIU6A38e2Kb0nMcxkf57OMZY2u+ik7ju6kYMoT6Hb7
	VuQ/emXUF8DBhZZ60xzewtFvzfTR3EcUb/omWIuTUk1GYrWGoKOpPgE18rvmNiFWCqn4LEINA6r
	ZqDYQ2AZxXLN8mcGsRjx4udLHKaifdkbne8BAAHHevD+YxKz9BbIhlj5h+bUdw4g/reSF4VtoxC
	e7fWlbXjjfvzBPrSS85zCtK0UKq4s+I6tCArn4D+h1Qalu9jEqm0prpc6UA==
X-Received: by 2002:a05:620a:f04:b0:93e:6f65:de63 with SMTP id af79cd13be357-944217bd696mr1528698885a.47.1793620141925;
        Mon, 02 Nov 2026 03:49:01 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:93e:6f65:de63 with SMTP id af79cd13be357-944217bd696mr1528693785a.47.1793620141284;
        Mon, 02 Nov 2026 03:49:01 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:00 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: imx: imx8qxp-lpcg: Fix the clock-indices parsing
Date: Mon, 02 Nov 2026 13:48:48 +0200
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKB46GoC/yXNQQ7CIBBA0as0s3YSwKQhXsW4KMO0jiJFaBuSp
 ncXdfk2/+9QOAsXuHQ7ZN6kyBwb9KkDug9xYhTfDEaZXmtlUF7VvmvCkGhCv6YgNCyMFGZ6okQ
 vxAWtsaMbmM+9U9BSKfMo9be53v4uq3swLd82HMcHLhc/CYgAAAA=
X-Change-ID: 20261102-imx8qxp-lpcg-duplicate-clock-indices-828fbaee36b0
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/6v7L1X5u5rSAsDoUAMgtN8tzVeu21cN089Cbw+fzqA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HinAXy6mtSVoB7DruBwJu7hXFE/BDIQ891NF
 u9vdP09TiaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4pwAKCRAbX0TJAJUV
 Vl6OEADNhE7z40I+qslePVWHxtl/AdsZugFLn4PuEOrHRPvc+jIF58nAojAp6nEX+iPYc4HxcrD
 TS+2DK803oF/hvsPqM4EZiU3bQjccKgVC/q37aLailgAC5+/MqUjAa6hvi2hAuKKwr1HNGDJjdR
 BiBOjNEWR0ThVntnnyDAGIfPloFr2/GFXq7MHVcWLe2H6T882hRefFWdTCDuSo4D2qOMFRFMTBA
 wqVerxYDZeTrROZhsC1JgQ8FEkKoAQ0qzzyRx47Gyu1TN7k+Zj30ckCjT0G9gz0YcVzY1IdFyeu
 WeGlSxfatmjQmVqZuIn1hL3LZD3FgSfhlASpoF3RzDpM5ihGWyxK70ReQkVWwnjOFa2Jy+Ygc10
 +/6/k4I0XHsz1tiexy2vycLxkTQTrctIHVyKDTyB+pBofHmW6uGHyKBTmuXKwODdn9TilDFrOhU
 bQvcegjwXTgp7s0thfBj2skwqHBdrw8xLEOUhoYMf+8+5PYtOSZ1YBD5lceTyF/pjHMhHP5tCa5
 9INk8Z+n+4vTm3e/2OnVsJzG1BU3knO5Cn7Ejn49R3GWm2uZ/MOr4FljAbh1D0Im08bXcxN5UrY
 ZNOFF3Ak3PnXe+OlnJvcwzl89/GtpWH/OmSzwwtW3VsQD56FgwlmPscy+r8mjLoc6ob9076XF4J
 9u15AQqkp77QMZw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae878af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=H-1XAVmeZCqmBwV_hRMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX+9q9eFFVM0zP
 g/cYF16CzDTYuqe6wZek144uCjgFe5vuruntrbFyPwfJTjfNJg7mYEYXBnmlcmGJr4EaRJiqGOo
 WZeQuAejDVsr3s3QiwIOAz3V9ZQ/zHb03cqr+FS9ZnFm37zqDwLLA9uoPHEiTKc69acMUEcMr6P
 p95Qamx32FjnTa7RaDKn+eLP/hDtTApE/8f2RDFT9vf7U0vqVtGWnJxN06CLnFAxc2rIDBE+Et5
 xOh6fimrIYHY4jZWaP9Z9mByh2eqRiQKLNXFjyDJkv+tEU6qx9F+xkkv1HzMtdAC8/1Igfz/XCL
 exRSqAcCT7Jf2z0q6z6ZG0SP74xkduvzyvtEAgGLtxMfLdRubUD1ukUaOTLEBFcGUDvAZx6VgGY
 5UsYO8uDThvnI3GRcUgFdC6VccZfnozAX0pM2KbCrIJJckqqh7pRRaFtAbkS+kyXrtjcrRjVQ/s
 myRsxTSQcgqx21Nw+AA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX0LKFk9+/vEdi
 0e2ENygCyJmtJJ+bzWSBMFi595+gdOiUVIPLE98B+IW/GSEHW1hCT25YBTF1AzVyt/EU1MBbYzT
 v0Aba1nWrb7ocNvBRxomBNCYqxpym18=
X-Proofpoint-ORIG-GUID: X5AMvhlM-EudV1SsFYUyVGdWuO48FW3x
X-Proofpoint-GUID: X5AMvhlM-EudV1SsFYUyVGdWuO48FW3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

imx_lpcg_parse_clks_from_dt() trusts the clock-indices property of the
LPCG node. Duplicate entries leak a clock and make the error path
unregister another one twice, and more entries than an LPCG has clock
outputs overflow the on-stack arrays the property and the related
clock names are read into. The first two patches reject both. The last
one makes a failure to read the parent names return an error code
instead of the number of clocks.

Prepared with help from an LLM-based assistant.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      clk: imx: imx8qxp-lpcg: Reject duplicate clock indices
      clk: imx: imx8qxp-lpcg: Fix stack overflow with too many clock indices
      clk: imx: imx8qxp-lpcg: Return an error if the parent names cannot be read

 drivers/clk/imx/clk-imx8qxp-lpcg.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-imx8qxp-lpcg-duplicate-clock-indices-828fbaee36b0

Best regards,
--  

Abel

