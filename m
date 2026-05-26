Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFEC241695
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800109; cv=none; b=B7OjCb69pOnhTPFL9hflIq0L5r8ImmuEKNiBUew20tPe00TBjN8siqR0KaR2Ho+uhjoEnaxYQX68RnleCp0HOO3lbRzykzjBci6wgkeg67Z9JewX7U3kYzB4THUwxCCqOPDhJ8IgS37Z+rrLjn74E3PVT2UlM6d6Cpy6oSFUl8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800109; c=relaxed/simple;
	bh=SBo8GaUsBUS3ajwUmdyP4g2M8m2Uhtq9FfllT2EErhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPQQ0TqX8vA/d4BHUsLmsXpJYntFZxUunOtAXvSNDa6awHu2sOt1fKE/X2NJeLXFc/BD9y62zbKwG7/cshLrDj5H3NInwJ7UAHGUweLIoRVW8kIJlsmrz30qA0LZpnkfClCR3gzT/nIGlR0dL8s18r7ahUR7ZHUkiDLgQrnJe34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGast7wV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEGb63ZA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGast7wV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEGb63ZA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsYeU1575417
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 12:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPtRSKjvVo2+z3vqCe90SWb6oDiLrj9MENz2zwGAmeg=; b=oGast7wVAdofn/2p
	CMLkS+djPUe6o/y+oz2exELY8dgGXqfBzqezAfcTi5SmgMloAsQ3myby9WEusups
	XuX7u+4cBAEKifIR5DOZRQrdKptVNU5//YNi4mRA186Gw9WYgqMtAQhwfpkkIWdr
	RY1i/zdydcvPnF2wxbfYx3qNgnwRg0VrizdwTbKZHONo2TqyB+SMxY6Setq4b46n
	QI9Xs8TlhRefVU9tr+7sflhp+fuRPKC7W4JAlKvtSHyMKWYKuT6J6Akwg/Dwy/gN
	JkM4t6QUIVKvHtlz7bhCsM1/hqacvbxxd4PjCSFFsoyW0Guz9AfhFmQzMqPVnMN6
	oTacTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwv1hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 12:55:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba224c3ffdso1304585ad.0
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779800107; x=1780404907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPtRSKjvVo2+z3vqCe90SWb6oDiLrj9MENz2zwGAmeg=;
        b=OEGb63ZAv3/RdF5OfZVvLfe+APSC2Ky6LVHUBxDXrqDRKtDomYQ7DJT7e7Zz4k115w
         qOXJPoA83s48DAO0EoA4m3XXbMBUgaxwEXu2hFYs7YpQC1c/SYvRhtfV2KduqVzzEZO0
         Z60qmePuCo3yGk08gTBlN72mnOMO9n8mD6Y4OZQgnM1VRTVkHZXFTarQFRmYBIZqSngf
         AiaBQqh4HZ89uIuw/LzNpH+xe7KE1rEMlgFXCF/wUjKoVHi2cX9QA8vzbcObI6QnGMOg
         684Wqh1SJLAF9JEBKtcUJF1JyeSpfx243ztOvyw48nnk6hZ+0GZuFapj/76pRgN7/Uql
         nY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800107; x=1780404907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dPtRSKjvVo2+z3vqCe90SWb6oDiLrj9MENz2zwGAmeg=;
        b=Ptg5DZtrB5JWcGP5M6wA3G+JxfOs5o/f+Mshobhhv5yEJ4FQxFlid2eAP22YGh++EL
         baZKhPZH6z57Ewi3eWTjCQ+lscsCb8uKVBPGi7jgJEr76EMye+oKdGV1V9SjYyfZum8K
         IqiOlML3ibIHKgDI7qkjhaci1lZN5QtlNr62xMfEqGKyqFOiUT4kQwPCS+V4OvyVmQIB
         0OYDzWKCNvd8r1Xy9+a7k8dBwJRaoF23777PChSR5AdBK8sJDZYT98oF656uK2OA4fXc
         /WonhyUKPSXMyCOZu+bA0LVeLJ14wGmxFzSfRED7oVyUMHAuEGsg8+Pp/a90egINfaq0
         LaHw==
X-Forwarded-Encrypted: i=1; AFNElJ91l8waEBilIlP0l5GCdpR2ydsnV66HnvkecRk/dxESIEj5fdICPUbaJQv1rMJMpVHokprr2mWszc0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh8GjhDIlcQ2+zb5plNq/TI1xbc2v2yQOUSY4tkpX5/OoG1bZY
	sggpdIXbR4ir0Nw2G+ttdWrkEoRW3PToxZkDHc5ZNhSH61OY7YKw3YKSeaVK+w1kMvn2rHwyTuV
	uZ7sxyHZEcY00eRkKNxowI9xgHs/kxrDQSomey8jy1apqZuEgYqKPk5NJ1HdtJL4=
X-Gm-Gg: Acq92OH+Ek6iWf/0Jie01Ve8BporWS62gBnGvo3Vo/BchslvScW8pfMT66jS/TzFgRe
	k8gkoh3tJaSls4lLNghDN2Am3B3R3HhcNXbIdIp99Qb9hK0kcOHyNTmSlVc8jq8udKdfMuG63Mi
	pARuKPxC+BK+0WIelCBPeRXjPUFqeTR8Q8eLVscVZ1cdIOOjGvGXfwgxMehwzLvk4+TK7BJrtKt
	8VcRRrfqscJUGy0YlJbOo980x2hxmZABOMjl2InHx4HlPf5UMdyBNPugwoH2VELt3Kh/9s6+rAx
	iuSlttDpf+W3Waw8j11rTO9hXcpS7UV1iEg8V3NSiSdLSx+0r5jhQT0GqxG9dnQAT3dm5IUCo3+
	dGkQoOe9eoxnPtKVc+bs90/dfhFwSDVHHTzMQeTnTE51WeomhCGE9
X-Received: by 2002:a17:903:1ac3:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2beb065f97fmr207160465ad.36.1779800107058;
        Tue, 26 May 2026 05:55:07 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2bc:7d1d:b677 with SMTP id d9443c01a7336-2beb065f97fmr207160105ad.36.1779800106591;
        Tue, 26 May 2026 05:55:06 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm129000165ad.71.2026.05.26.05.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:55:06 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:24:44 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add the definition for the
 USB3 DP PHY reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-gcc-usb-resets-v1-1-6d9e7fee2998@oss.qualcomm.com>
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: M-MoYV3czpuqi-toX2ZhDvWi0er9R6ab
X-Proofpoint-GUID: M-MoYV3czpuqi-toX2ZhDvWi0er9R6ab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMiBTYWx0ZWRfX/muwi58G9B9p
 9h/AotpdyAMMWh2RzgIHOW3jbYo45Ln6lN9qOIcwbRyf9QMNnHvjt9te0V6D1iS6rlsxQTUe6NK
 O79wjwUW5JD6+pWIBTRQ+AOcmrv3tDRiJwzKphT9hS4Nm5Teqkt75GV30szCsyUhoJEOkimwNIp
 2i+Y0s9S3K186Hm1M+rhKPZGcyLHdk+MF4fR77g1jTRlSlDLNh1oJ5zU6ONjEJrlG78l9zESBU7
 JZxqJC09g3h4NRx0Kezl5EKaGvj/tFVc7Iz7YxATGWIVaX/+LC8WbPjWQcJEYnb+aao/vqg8aUI
 iKcVBxPPvToQ59sfWNvETyy9j1A4JGuA/87xP83vyAk/JeIAN3Lzl0/uUOISXYDbkamGsljl7h3
 TzMTcZP2sK1iUwtIlG16NGC5ynT/56C+IBgf3jpQFteDygYRWIwl/8FiEBQFDFSnyNnfNdwaJrl
 vYSVMaIaiIlSwFKw3rQ==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a15982b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8KYR8grS2LNeUGeHJPkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260112

Provide the GCC USB3 DP PHY reset definition in dt-bindings for the
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
index dc55e5652caae247359f869a998f81a785a82e0f..d3abaf541a33beaca4d5a2a8a0930f2a45ef8524 100644
--- a/include/dt-bindings/clock/qcom,shikra-gcc.h
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -258,5 +258,6 @@
 #define GCC_VCODEC0_BCR						21
 #define GCC_VENUS_BCR						22
 #define GCC_VIDEO_INTERFACE_BCR					23
+#define GCC_USB3_DP_PHY_PRIM_BCR				24
 
 #endif

-- 
2.34.1

