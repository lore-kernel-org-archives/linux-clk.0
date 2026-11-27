Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779711;
	b=5jRVgOicz6+Zm2tNRheHXLyx8+WGTy8N6ng56rQWpyKQDofpVsm/2nZYWMSD2o/Cnhpy
	 M6/m9SzVGFskN6V2YXP3FfDDWwM5aYs3SSCYNG2pgdeNInti0ofCapi54Op3156qSKih/
	 virLRWnZLDauhbiZPqg+UD//NZH9eM4jcGMJ2vi3lLlEJoUjey0bfKEdMzzI9cAqWm7Ri
	 2vE5tq+2O18WEMoLn7qEY3gP/nuUR1Oz7MprauCOkEda2ynv1uNX0UxmkU7z6aL8z9Vb3
	 mBPLTlHgWq4mc/Cmy9PRzOOy2UHaJFxee9z4ozyzeIt9gP42ENKFtDXwyNtls3ps5hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
	b=VtHZlEU2dPioWplJZLbanaRlr62AsbGlf39s66VVdBh8+ukZIB4JtqQ091LQYOH5eYWw
	 PQX5wvrvkJGgEW8qB4AtGu6CZqix9e93WiKxxZFj8WPr9Ru9Y933Kjc1SZgRoUc2/YMoQ
	 h4S4B7mc/KjOVOMyg60Vj/kdiGzLftv4Lrd0EQT6rprnNntCG3JHXQF+8YPRNYgFl2OZL
	 ru3dtWXR9uCUolysXByT75VzyAJ0/8Kn0dMS5ZNWAf0nH2FmljJ9J+j6vPhR8HQhWCLS2
	 200JZdp5zYKb0iAC69T4ehGARFhXEBYCX5JpMqmjJzsEfkZLtRSaC9mWMy2V4IwF37g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CS/jqBxP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHvjvmiZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED7460A3811
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED7460A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CS/jqBxP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHvjvmiZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp1Gw1047034
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=; b=CS/jqBxPR0FxFoC5
	pSPSKZ7d50UrShxfvjlymocXvhUnD+pa+IyRau0O2dnJhmov2uqCI/x21obm3L68
	dXlxEyBZgFCkJHOkb81Er3eMwscd39QjMl/WsnVTADbbnM5nktWNLi/6rxWBksF6
	K1n6QiC3LGU9Vh1/AtQI8n9/Zyukw2p66xX7UoUUDtefOk5UVdUOXEo1T7AWcDoG
	3DpsvBjw7f+qyNbOdQXFa0xmm985I/GwqbdyG40tIo7QodIxrVS1rdAsQF3iX6z9
	fVNFRmIoe0Np2TV1UjIGyDP5DbsujRtHVDszDPilKPQ84/IMHOpFLob9VAWj5TxK
	prjQPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqks95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so1384078085a.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779709; x=1796384509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
        b=dHvjvmiZYv9B5t7RlYFoph8sG+U2l+9Xu7W4kyZdF4CfPFbvMv3WY72vLTE/uvicRW
         Zd5Jt/fvgbCWlHg6ldGNdBnvHe8VHO4sty12lbOgO98a6lAIRGrbFaJppS1agYyP9TXs
         vACuosmc0+A9/xjkgzwS/R7MlONqdFwI/ydPIcqWbnbFBVisdcRGaYGDmvnSJ9fZLekc
         Km07xGfGS60ucqHKJyzX7qUm7o69wteUcOlRGhEz19zF5DRtQOQpxzcNOH8lhoBL0fk1
         wKO7mIPrE2HyLyV8Wh8HuCj8qcZHsszV8fKm1C4xWRM18nEbtzrPUCZLLrgjfEI5Nyxz
         BcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779709; x=1796384509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
        b=xHgdXBpRkyfZO0tG/vAeSWjNji8U6VM8tuQems0W10FT6VSaJ9KmVFk2oZ98xV9qga
         rmXJMQQRO5MZOOXzCgJcRfIJGKrGBWq7jG4TyGH9CTMR5RTs1i5qUuez/l0pQyvtMOAd
         V8ip1op3qGL+e4oJGEDVSngfnNlnEcKd/ItF6SU+4WDWEN/Ebs5Ypu6JS5UdX5oyQlQR
         rNJIEWhYMVfsf3loMPhPyu/PEru486NtUGyx78dfm+LXbKZLnRrhWijhnKGKQvIrOmHQ
         NC4prThcpHO1OzzS2GPGkJTsy3aqSeMJXjMuMit3rrgG77wr6cVlHi7qEEgMhjxyZuEI
         NkQQ==
X-Forwarded-Encrypted: i=1; AL+hErEoS/9tOVfhV5e7nj1mEicOE5o3J8tX/mR7ViiGMHY4xbgZ5WnbCqmOGV/eYPIhNEP/dnQwKm7hQwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cmcgnLuokGGQF169+K2QB7F1zZriJE3X9pgxOLv1lV2V9gku5
	uAcv59OSIGaKe+sVx7PvUwfLOjO54WX8OaNZkC/bZpZxOEdLvVzoLz+bZJspU1gRQtv8i2k/NGa
	5VRwnZDSAEtUHUKnWjo5qyPKZlSOly317OZ+zQ1RRdV17b1oAkl92GQYgkRRt8Xc=
X-Gm-Gg: AZFdTZf7x+tVprXnHcPxl+pCqyaAzSoZZwiYKASGf2kN3teGlywPGiO8ar01lEzKnqm
	b2SZnYeeSbODp14EmlWZXdBKexld+nw2+fsvwdn0NcDTgLQxY2Jto8laUb1kLFV2qIL9FLHjvxM
	UDn2ZjT8jdO/HJ6zw7dCfSZw03cvbu9amhabNMHPNZUVsAJ1c27gJj2HmDvZYn+Q+b2jN9btv8g
	jW1VKczggPaF43poy3bALlWRCUJcZmpkyUm8Y2EUqOYCFjnskzvBMNJfNSZASCriiX43H3/VOwC
	5cVFehK1QLxhCbWNgq2HCAPvQ8/dSnZfsYelnLm5LckL6YTtNpuYq5M/ikRkeffTKimfZmKzkDV
	atNfRZ7rkZO41MDQKtfeSrBMDkh/hcCjAZPYbmzFPdXBDzBIUH7v5C8BGskxfAdu6CGm1homPFc
	gw8W7XPEuxkcSJXKQDxL2rKhwtA7o7VdJTZVDrRPeWuBdYmCn8r3w5gfaAv5MNIIY=
X-Received: by 2002:a05:620a:1707:b0:93b:c58c:d3be with SMTP id af79cd13be357-949baa0f7fbmr3972939685a.37.1795779709401;
        Fri, 27 Nov 2026 03:41:49 -0800 (PST)
X-Received: by 2002:a05:620a:1707:b0:93b:c58c:d3be with SMTP id af79cd13be357-949baa0f7fbmr3972933485a.37.1795779708887;
        Fri, 27 Nov 2026 03:41:48 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:34 +0100
Subject: [PATCH 5/6] dt-bindings: clock: qcom,rpmhcc: document the RPMh
 clock controller on Seca
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
Message-Id: <20261127-seca-clocks-v1-5-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cOfO/lwWerFvv74BYZiZtxxqDUTbGn52r0I0TAxffcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxwBpxDUHhMVQG+XeyCyeGNmDrCcfzYqwi6e
 DpBPvYCm2mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 w2KcD/92QSfcPtkyYV8dMMTsSDHNtwx6X0n3t6nE2MpvWc2C5UyR+UXpYeCgF73fQLwau1i1gKK
 t3KKEktkj5UkGynbnum+KKn5Al+ti20lgtrrh9s3Y+QnjAE/8OXEyakvVz3nJy46jvgX2nOotLs
 Nc3YdFd3CCsqTASrWaFlwKDoTlwnVdGD6X6uVIoblo83O2n0F3fsoSYksRHr5Zp0+czHBWTkZlM
 Q7RZxL/0nOAb2cEexn5vU/RXJnRYgvZANTPE1CbaH/Al0YS1UYJdFlV+pzv/9QLEc2tjAZT/wWL
 1/D2tWj1Sok0S/t7QM0dvNwnl/osFIL5kmp5kXG7jG16RWPPtfJp4yXh5FzwSC2EHY5ChsQom8c
 7WC6eEIiynYkOPBCRDfdJLCCVccv4RAHrll7P3eynqvC52KUXeJ4Up/mmacY7J6SQ6Ts+Isz1Qf
 AwyBt42FSu1I93fmU4FjD4qz3+WDoXPxza4jqNz5pcWwwGiY6mFomVdlLcjD5dtijRq0cXxPHVk
 N8NiG2S8DBkNrgCMjGwMWdZDeqD0jUg4DTBHTZn/GBtm/5gHTf1t5TA3AP9mS8x02xNIgdUnugm
 pcoCy987Hj3CE1UgEr5MAhyZ5UCrj1EueNKdWolAyR+EXRTcKtQvP+qEN75OpvQqe7HXfs2wvCM
 dyKoQJYDW/uZBGA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: tJVfPT0Xm9DM7JzIFJ4tTI208-1BPyFc
X-Proofpoint-ORIG-GUID: tJVfPT0Xm9DM7JzIFJ4tTI208-1BPyFc
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b096c7e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2pdyNXWkZcuE2R3gGgkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX3jwqRQvfRH9n
 IgVkXXmkrV1T/suk2rlSBAxVRFZKo7N34GuS2ehrmjCZKezr91CdxbHjVXIVMHjiRSAuSfYuQbI
 Jio2Bs8gU5PB/gNuLg1gie+MW+QOLd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX+NLwrcezmwWY
 GUgmDQQ7CtwQUCFjF8IrhZpRhEUHlfTWJOvxrM1G8M+5PBy8fmziT7hdliegoQ7owH9Bpfn/77M
 VcQWmmkNrAfcIGKb8Ddxw8YsVUoA2gq5in2BtdpratUkvWgOhgsd00lHZe1IHcHhl+p0oOpsx9A
 aie6WGWc6eyV1lnwjSgVtcXBBktv1LI0fLKm8RptbOTqRp1myDm8Q0ZSp84p4D5J9OXS5CRYXPZ
 iCeNNZjsnGeNCOZAfDIim4UbmM/NOFdtA3kCKM3YVci2yVknkqmKC+zwgIFnC4rufFClAKSxYug
 eBUPzLYyRXgC5/iBv/g1FV0WsoSFpo+wQm0KZvM0ImlMBcrzh7ws15qEOkI9yDr+ujzBuHCSZNh
 PmEnMzD5ojExpUbyol2kCM35KbFau5jIEN8VTNMNxEVtlANvptBnB5OjzvU55ND8YYvMiHFUzZU
 Vn2K8Y/OgR11myLSeBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Add the compatible for the RPMh clock controller on Qualcomm Seca SoC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa59ea85582d5bfd9aef5c48ec6903..cfa78198b2c0cca85888303b25766b7b01e2c13e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
           - qcom,sdx55-rpmh-clk
           - qcom,sdx65-rpmh-clk
           - qcom,sdx75-rpmh-clk
+          - qcom,seca-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
           - qcom,sm7250-rpmh-clk

-- 
2.47.3

