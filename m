Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C63D0914
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933491; cv=none; b=M2S577rSqSJy0+nd1yeEy9ejzxE0w560oXD5oNJ+zHmmeXdDiLzo49EPfYMy4vid3mJAn4Es+fx2aEXbGtIHv9RUo1hXFHKbiy7enepk3SQEuRvD2QF6CFpKBZTRQdBXU7pf/+vWbMC/XT5SUP8+d1tcrwAOXaMT2OfXU43d9Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933491; c=relaxed/simple;
	bh=fvzDiZ67AMugJfYnW8hKFy6ptEIPS5tGSZjlOp7y0GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtP9m1iDF2lBkFH67TN2XSI3pmUH081rMAA51wo8bUkoRY5BZJeH0CT+2tkBBNp0vSCz2NQ0Tz4G3XXdDZSrwIYXvtaas52DtlrvIHAtv0AdzOjMXsdM3RjLynNipRlcw4HI3ZoiTWtEl6PGlwbnyn2jlo1YW5ADnbe0qP9FYuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtL5+IoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CoazYajp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtL5+IoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CoazYajp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nwct674465
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=; b=TtL5+IoDiaQq3q1J
	dOJvBcjoXyZJyTPVt/1FHGGRUxwkG/L/y2Zd1OeP7jaMPI8ESCu1dpVZe6q/aNrD
	+mkPA88cDx8dWOU2hW8Wq5jt17WpaqsfMmN5SJgjTqCF/hWDmeKai0iJvvZrIhWj
	O3JeGcYNLiihHjLHMLtbzUqg3SLCbpb0Eoi3uU1nRy9kUWsDxQLAs03zguliiOE4
	K5SGkuVBjmiU8MsY57IJv2qi7XtqAhJdSFRttvytgk7us5+vZDHypkIcHAau3La9
	GoxitdVjWzKo6o7HjRxXe6FGet3aKoyTqy1VsdAY0+q4Fvx1UjTyz0AGd3FOAc3i
	vH3X8g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgnbq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 09:04:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so4214147a12.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933488; x=1784538288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=CoazYajp6YLSli/4wd3VshEX4OJuOOUMtVd9P7a870odib8lmmeixvwM+8DmEGw4yL
         aNW2+Vw34xayYANpdtjlAhxT0Udf5sXXKkH2/Y3VAHAnBm3LWWH7LhKu2xjglGAUeZIx
         Ktjt2RAP51x5KwxAf/c4s9drKm0RojMvHa2GW9GpaYWOCt1iU2jS9rLHd+TPdtG44ElX
         5F5JZUVXl9XuB1BPVmGGMJzgLFIiJnfnnmJ6GWKzbOJfTeCPSmPT4fmpeKIQLSDrvJ5W
         fAK13dZRKP9DM2Yi9acuIN640u2B6gioZVMqGiVfh5XvwvXX5TPdfoZxYdpBnNlrgfHr
         zUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933488; x=1784538288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=a4zVUlsiSZW+gY+3BrJEVURXNzKKj7cbWs+pdLPTNiKG0Bk9aHIa4MyUVbWXseDdXH
         vrp0fDrgsX4dJUdyIMHkP1hCZgN4pUXf8K7ZrxDdtuJNJy0ZsOFoNVoQPSy/ptpsXxCl
         TGRHHjCJIrrf1o/KKd13K4qc56Uk6kXE48jmZFeDATvHWqibbzzz4QmbTdvYamp0+E4/
         8JhmnhHIPocv6D+WnJgpLow0+79njBCqRIrquCdAqj+/iW82WQUdQUoxdY+9BlxYr0ly
         rjWsiyk7EZfeCBEZ3sNLxWkf9wyKM3JmaagUVG4/DRbfw3/M556caFVUd1/LQkvjGpz1
         PGOA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6RT9Sb6Kv+6Lwoggkc5c7b4cEmt/QlekGaLd5Zjo7Xao+SVRW5Nvi16Agyy2p1WxWjv7ryXwCkrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YySGR0EQQNQy3luAMrWnM+YQhh7lupayYT6V/EOQOEsvTkxZK5G
	mUQ/q8tavYwFsNRtU2f2rU51Xzkx1HCTBBLv2K/P27QqMv772HYPvkkseaWHyWHPAVSl/J4sS/L
	frgjzyBqtAGVXpXVfTLGKzXLE7rrhOywqRZWOjnXPqCoOmXMVYCuqbDm6JHHgmK2reOfGkDI=
X-Gm-Gg: AfdE7clY/k5oWkPqurQCx+trtEzc8IYRwrsG5sT5UkGhSfx1OQghRgYL8OXRR9SW936
	TWmAJICQe+6BWGavoqrlvsjvcEekH80FfDdYK6L9X5cT2ON/suCfMIzjDwM4QZ6uPxYTQ7TUjfg
	imBz/OIMhDlbveroe8XIyD9Gg+IckY65YI26HUIgEGdpqfmifg1gEkKcm7oT5/k1MzfBqvUO7Dt
	cihFI6DlhwFXWHL3V+Ny3vSkk7dsmITED6TlcDsbJ5wJpD+HDoR/02zgom6/X5YrXiWIM8fMOx5
	L0w0+g6TR3IE6bt30AaRqM+Souq2BdVHZH7Gws0bPSAokvQ/5Q+3Btncpc9pLtz3B47QSRrawvL
	xRPxVRFylbYk5vNiROyYtSnwWNjT+AcZvteo=
X-Received: by 2002:a17:90b:2247:b0:380:ced0:ecf9 with SMTP id 98e67ed59e1d1-38dc7822590mr8390937a91.4.1783933487291;
        Mon, 13 Jul 2026 02:04:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:380:ced0:ecf9 with SMTP id 98e67ed59e1d1-38dc7822590mr8390911a91.4.1783933486867;
        Mon, 13 Jul 2026 02:04:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:46 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:11 +0530
Subject: [PATCH v2 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-5-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX0swY3hNgXaEq
 IivSjFMAE8072qIQtoLeqgkM1ViJtL5J4WoI5B6MQLLIYl2LogTDkSPtJyK9pm6rdm2vcPqUyZp
 U0hhHqec8Y3TQRi9qSoLMEOK2PUViXQ=
X-Proofpoint-ORIG-GUID: ynlCDazJGfX-zWqajUqJ9Ut79T7KkqK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX60SCue+68HeD
 LQkrpN9jmNhZUg3+ccIFxPNdJoq8V/A2hSelzt1jeWF8tGZo2MXzbbg52HtzVU6VsVp9phPwqjX
 VpUX6Wk5PUvARN1Z21afmTu6nD0ohoCIKNHmC5hIUcvll5GTgnOK4ObAQk57zf3POlLmyjIV2Hs
 7ulWtMCoW4ewuGRFm/jnVX11NAiosYq6ge2hAbD9g6QFQYnEFH934HE33tVyM9uYrKqI4mphbVH
 Zfufl72oxf3IBdGL1jaWLNQdCC+IPz2ndDo9++MpNJ9Xw8w5akFdZhVEy9bjgDKoWw2Mmbhc2io
 saxdhQjljPSpSpataNYNk9jueD5oSZJfINKNoQHMJ/eSpnTRZVKkyoY7rG+nfXMl1F0LgKdFUm/
 XBev9slqz/S8E4S2uMJaY9uVeWDooO8n5s+1sIvjEHaqOODj4PNZ7AEf15IYRNiYM6bOFGuQXiY
 jRwPjhAD0tZC/C3kVGA==
X-Proofpoint-GUID: ynlCDazJGfX-zWqajUqJ9Ut79T7KkqK7
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a54aa30 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5FXc3QUEpXE_4WiDhFYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 03359479d926a623c467f1b8ba857d787366d411..2185920e1b5d2154a23b67905106f35e0b71eee9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-cpucp-mbox
               - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,maili-cpucp-mbox
               - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox

-- 
2.34.1

