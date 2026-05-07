Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE34144CF5F
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173738; cv=none; b=X29SqSelIJUV0Uz3dN6bXYgb2lrDzKfvihgGzTJnE+BoSP+EST+RWBDZWdhPRBkEcDzM7d3DyClQUpH85C+Uuls756C72hW+wat0KlKNKkw9TGYkNCgTVLxnp017bqyoK6kFLqSWgRZ7qnHAO4A/rsWRWBQGFsiIWvz6WawnS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173738; c=relaxed/simple;
	bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/yhmfseOvcH3j0PIeaRiGVnYylmuS57lzn38avFo+lVLFUn0dwWPlYgEFogdFgyDGmwVXPvdbdqsJkjmw+kBQ6Cmxdx2bc44Zw98yNvRn6sH7Z57e2rQwdPGKOKjtbJjhw1nojTho2IHXjKxYaRA1KPvHqXNR+dB1MWLJQtm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5D4cKL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyqKXgJR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5D4cKL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyqKXgJR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647GnNGY152860
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 17:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=; b=c5D4cKL0hRwkdsXP
	pYTtYVJW18vLeCzo2cbDYEd772/10tGRJEJzYrHna8GYTwGvZzbBGtedH8R2kjqp
	zpOTk+ACYn74kRvTbUUbMhyg4L6pyO7rlSSi11P83FmtGAn86hAHIm5RZbzz1MDA
	Hk53gKF38ap3vIi0wT/NMqSEosHGHDaqmD7Y06VJIzpfjvUhM1JNn8WbP2ZT85uC
	3GxI8suS21x+Ktpxg3oag0yf29qAMEG2abtMhCFOSAOSQXJRq3014LgiZagrVb34
	Er424XLgFWvhaJuz7IIgyAt7/tehj/bYzZNasSOOkMNseLEW69ySryv74vh3fFIh
	erNdlg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kcttyw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 17:08:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba224c3ffdso20964935ad.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778173735; x=1778778535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=QyqKXgJRlsrYHMqnJotNRbgp8U3TdP5yYlACpiTaYM1jpZDoJgbAcC8Fhb79LaFv9P
         3ljdPHnnME+6XeoxBxcNEC18HK+df6S29yI9t8/IiVffNzokmyLtU7XCZAPlylC2gSmN
         7dYjY6VlGRYnJqD2vVuAvLQGWNnn2mbkbwLXZHUpL/xEpoYs61IGkzVMT3/Sr9HyMTRV
         /4jKWFqVOhR9o258wmfFRsgA2ae2ivdImg42kPWL1xYMbJQ/kprmn9fAkqeZMPThU4k/
         ZJ4ZGZLCzq3fmVdZSE6f1fBmKdw0lhd3KjE17bcvTntE6NWFb8n42dDKl2JgiI0BhZ8W
         sTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173735; x=1778778535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=Wbm8DKD9fHdsg7zplUL+aN3TnWxxy5iMaw0C5ucG1r6C1u4XoMOLWl7MbAqngWqDdQ
         ZGME47xcb2coW42XH0DHjXyXfn4RRZ7QjGcttBwHse1I79EbjNe1xtthvfU4A4NY5mYf
         mDsm9Qbu5aUGl4MNDUXJ+F07EXg2TjUYuhexzPWtjno3D9bzOH7+dlzjEDflQhFgBXgh
         mEFPDR5actcTYwZKHX3cd2feRUjdeohJ8Uh20eomptxuQGEvb1ZheTDeb0m2zUsdZ4Qv
         2sApNDu985W6rbmwWpOWf+16I3eDtqYEj9lXqLZKQ6xaG0meoKV7BMzSgULN+H0/Nqm4
         5bhA==
X-Forwarded-Encrypted: i=1; AFNElJ8Rm7WJnSQfnsYVGZ7xN/sOzc0bURImSGd3Rr03F3yo3k5n4Is+hsBuk2ZVJegyIsbVkJNQlsRlRGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx949Sh+iSgs/sYBV3Isag6TOIKa6xKa6Ku9narAo/BC4l+EF5j
	eyAcCUFKC0hwQ+2yt/7oxusKWCezQ1sS2GCxN1s8bJJLT03PWSnaT4ApQKxxqLx1i1TgpmpBBrK
	ub+kjsBdwgSWzBWZv9yqkGSzNkwQof3dwEVMnmNxNwlFESA9BIN6DWpDfWd4He8Y=
X-Gm-Gg: AeBDiesvj5gpIIA9FQW8o7xKvzrwkf/ngRNPMgR9w/oM0o9TcBDwrtrUMN7kQn5VRGE
	BbeiNBf+AMYiMFwqXZIoKfBu+4OpAQbOjWd9CEaPGFHXV1I/q+rkMBXf1MLQT1PsQ8UImU/2pOn
	9RSXmrO7xG8bNqUdqhO1PoinTRgPis+9oisTjsBDUTPtHhldv9dse4x9gQQiSlV8DTtP7n9eLcH
	pEutgtcZ3oOPMSJ4EPO/KgRuv+qwsN8dy4ovGhm0r9dsILIyo3Lgn4a5TR0uZ3zUMUavFmYrP91
	Cldwr4miIc516jfLsj4UM+rMRmwFlhFA8xeuC7h3ByDbaS0ZN9yuyRp418nxzDkiwBsFEn6GQa+
	tRwU4l0ZtJ1XXAXUR9VDG+bmdiyYaIXMjvxwUjQH0NY7vhqCOVWUs3E1VN2ndmeLHXOQb455voR
	0T9riGMGth8TMZe/H2lwOscfw2xf+iXHuG1NptGDkhA10xlaXl7rRRylOz
X-Received: by 2002:a17:902:da87:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2ba7a330deamr91688255ad.41.1778173734757;
        Thu, 07 May 2026 10:08:54 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2ba7a330deamr91687965ad.41.1778173734311;
        Thu, 07 May 2026 10:08:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae78751fesm2530455ad.73.2026.05.07.10.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:08:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:38:29 +0530
Subject: [PATCH v3 3/4] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ipq9650_boot_to_shell-v3-3-62742b49c991@oss.qualcomm.com>
References: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
In-Reply-To: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778173710; l=894;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
 b=KAcigkWQwEraOb4AcDg4/E+LrPlXgvdx8UBcATtXbUbzA4vL/7pLonUoEXXSNCrkwheJELs0Q
 0SLs9vrgVF9AA7OcQZ8q7FQR5vArssQ5TJ2QWKZnAfH9ZgWWPalB4Ue
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fcc727 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=w0Gmm53Jqs2pEdcyGHcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: uBw1V--LZv-tmIzmt6soQLjcQfF9i0oD
X-Proofpoint-ORIG-GUID: uBw1V--LZv-tmIzmt6soQLjcQfF9i0oD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MiBTYWx0ZWRfX7ixUUY2niOi0
 nyvADTIZ9RwqoaeJkZdBiS4kdkGIu5Q6hmD5kFo1FlEE7Q1vAKhuE/iDpyWQiG4OyF/CsqPqqtQ
 aYS1gN4uhYGe5ORTWey7LTG1MPaECPbFBRs2VCndm4L076Fp7T0g3MWImGscQO9zUIxCodyP9ND
 nnVDrwcXUdtD+zIGCwvarzFv1BNdLV0QoFjm5gK/kadq/zwFTrYnj18GH6eB0yOR2AjWDfhVS/8
 S+54y8xRNzJJjGCEkg+b8v7kJA5jDyERrJo/0cQoQrwBGa2EALXWyflTLzZZXZBI+KFzwmO9Qd9
 5QyC7CvIXff5Iz0OT5omVyH78b5FzEttfjC25saUZth5g7/x/FQZl26Bc0k4AZ/eT4Ch7yAuR7J
 OD0ijJDU9+ipMXXwxrybNW4RfUrTg2qJcAdUZ/MZTD8+ejfCtggPEmj3bA2Jkjq2G+QE2Kz5gC4
 0F+PwKt5VAIt+7P7NTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070172

Document the new IPQ9650 SoC/board device tree bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..5d0855765fdb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,6 +365,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1

