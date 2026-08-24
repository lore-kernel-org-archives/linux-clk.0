Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7B42900D
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572592; cv=none; b=UhceGcFNhvt9nlxAHpfOab3+wXd4ZSUJ1HKVcuLCGh8IBsGVAAhYf6gtwErSk77LmHcTEn1e58XB1or0glbBq8yiy1n2CHAU8kD7rfXfFqg0I6srjuMxYJF6Q1XkjTfcU3LtwClbCD/qBb/ntieNXRW4suu6h4ONTNG8CSehGCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572592; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sw4fvdzeXbOToa593tyfrP24cA12uVtHzJASV6mGcOjdI1Cer0KQP5hC/+8pgi9/Mh+52ZhqwkmiRjtm0V6vUK0F2QTTaHKRP9Et195M416HNQDmLUKd/pYuXfip0G4tv66hvO890KycYM2QmTcEvQzxo7FZpYTkbeeMjcMNSWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKJAanxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwHYS2Gl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKJAanxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwHYS2Gl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMVkB2647982
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=QKJAanxk7tw5Pe2J
	vEb/1vntPDrL046mvmH7b2aVD/L7vuI3+tsstMemRTI8v52JvTCOXNMHBuKnj94H
	vCVBWKOZj3tLIMReVfUelhihFo1n3OJ/VjjaSPuipuR+W6XNVdpKrlq4pf/XSxlQ
	GHiMBoAMQPosXkcmsulVcGJhyeYKoOhPNcj0xCpWLYaGr/Bwt29yhHxgK1UIQsq3
	rb9qLIAo77QfL+CGh9O+FdyB4xIHcM/uOnf2ZUhr00+EbN/g8PDT0u8LhroUlpO9
	Zd08eJJOr2Sl6hkdQt+7hqemrBnKl4V4Przj/RrPc3hh7sTCliM2qxr8RbhX5OSG
	otQqCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn9ahp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso61003251cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572589; x=1788177389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=JwHYS2GlKL5uswswk1SjejowxeoUNv0ZZSa+oTmJBMrdkZ3XOODeJE3Ei+Efkl0dSR
         w+VQCZEb52LOcIDtavtIqW12R9eIHItcnJRWja/v7XrSzF625pmkyhoIKIHUB74skVaa
         6NS5FshqoOrFlliIfQBWe+/AYnb9e1+Y2ANzfQ69cFM7H9SOXmYSG47ubWXAagFbFNIe
         Yfl9iuyrnlPfTGEr2xhiVw4SKhMgYcwpawPOQdesxzsV1Pxb/JLZakxPife+2BYiFAtK
         d/H+G0r7T6JD2VosSCIrz9AcVkdFnsqFgHl1RvCnkI6JsVitbchT7PSKvHyqW8WIGIZU
         xinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572589; x=1788177389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=sSQT10+lo6NKvt488wW90Or1SKNUYC+0N6H6vjdGxlbdLNBf5bUnbMIdLj+nRS08FS
         gG/QW6CCPogiOO+Awbsbe8UzeTTTYL9WmSyMrGzuzNoCVIQFnd/Hu/TaJd122uUcDSLb
         /5uKtbiVdjIhvf1pgTaUAnI+T4Ouz3IMGGQGtI7PjndaOHYDvPPkSgyfAwqkQkHTjYmK
         AapNR34ehsocvIUNMPFhJM539gul1tomLRkuAefLwkQ+2t31GgqpHhb7k9MQ/Dw6b3fp
         DyG5vWqH8evqMOaMALGldFsbVLX7G/prxN6yZXwQ5+JAOYSJHThl2LFuJm3YwPREdTEl
         nZFg==
X-Forwarded-Encrypted: i=1; AHgh+RqSvdpmcnqdjXKB0jG7p6lj6x88v33JIH4RpP4a/4s6QXvxMvhQQWjbKgNnf461hZK5CF5gjpFEKy0=@vger.kernel.org
X-Gm-Message-State: AFuF++l/idqxqqJ7hgXhV+Nm6I6N7Qh8T9z7xBy6QZRZFLmnns2M/hlE
	OHQnsflKn3LyxjtGOlB/mkJKUmP170WkNr7ruMwY8WNjsKEPkReZao96hU5Qk2QLkC/t1lMEk9C
	alwnY4wY0THS6wnOn2dNI509WZjDzuQoL9hCZ8QAroy7rsQU86YVYg53A5HmLl5Q=
X-Gm-Gg: AR+sD12Siy4Nk1du5HEs1uP+LKaQ/F1xYBqGTGZ0hprUpP4lFwLTVHuVkOtpAyZLOyR
	3TEX6t5d8AHWF1NjKizr43e3VUGodtnze/dPhbu/x7jtV7S8Psfxes+X/O2A4dXiOqjpSzOCo1m
	b9w+fTo6vA/Fle8IchUSjHsUAXjcR2PuahOH+fiFLRAu2B2X2yah5jc3GC832k+uBGAq5O7Paad
	Pdn1l+FmBXU8zn0YkizeAKyYQKK7jG6w2cEw0FyNlhxli+LdNyEfXjJmTOoFRe4TpRRSENpjQ/K
	voXj2EgX3U8eKh/tQ+rf6Xi+MhoREv+pGIHCJgiIChu+w4TpFEP3FE2vSZaYABaZZdopfkF/EES
	JU+HvjhZE
X-Received: by 2002:ac8:5cd2:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-52df5696dd2mr214101421cf.16.1787572589426;
        Mon, 24 Aug 2026 04:56:29 -0700 (PDT)
X-Received: by 2002:ac8:5cd2:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-52df5696dd2mr214100971cf.16.1787572588857;
        Mon, 24 Aug 2026 04:56:28 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:23 +0300
Subject: [PATCH v3 36/47] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-36-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD4th83vb+iaDFw7h8AA0eJ+ytMB116I9nW3
 g4NbrOrjuyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww+AAKCRAbX0TJAJUV
 VvHID/4kWEoDANlf8jQJ+bmqqsp0huQW6H2ir73t2FMh88pXnRkAD4LsdmRt1GmjB81M67Ntvof
 I1QZ22N5yT2jV5XHpXmhe+xMdm/YwjsKujiAD9FZIndPLazmZBVtBdoQrrYtOfhOv6L+/9TEBo3
 4OCoKgfbvg45fFkeCiPFrBxCN7D5xIxjPLbco4eelv4ZJYONUtuGGkiUgatAfeAm+tovZlEdOnu
 Myqrz+FXX87aSuEwg22eExPEtg4o7KpvUR303wMF/O91ou8zkcBSpnGC2aSYzG/pvgwRt28D7Ug
 EB/qFA14bEZTd61suU0YhVGsZcLgIwTxZQEmOwvpR0GgzTmD+GBBxgNT1JVpnHuIvwv0L5N24PF
 x+aoXs4vs06Y0exJ/x/KnJcHGNoB+NDt4L0lD0QJft3gArvYlEJFfKpeGG9G1xY5KrQ5cM1slF4
 ZGJZeWunbc2L/hv5nTKLLGtCV/1TwcH3ihersO8yANkCfI0fGeXgReQDo0PIeG974V4rtsenzUC
 bFOu3tFQnJrj5ZaVPglt/fP42TuDO3oJQhJCLGjCwvrLK/ZwqxrrymtHlYR7FV/LrMTzD6sKKYS
 CEeSiPG1N+1MGBld/2aBC8Lfo9DB4uJS9ypzOgnLusfacc2+q+Tg16ZocH6qYsgpS3AqGSrQx9L
 WjLtf53PHNvAuew==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXzl9PEjk26t5K
 jN4tzSzDX7dwKcdQwuj2sz7VnBQbaWMijoNuWEiRFLoir2dZAf4OFSRoMEf+R2XvWWKSeqXZO7H
 kBFUupVqnPp/buEoWXFQhXD1ZjT0oqw=
X-Proofpoint-GUID: PIB4g61LAhnEgBihuPlgdYSVoZo364rM
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c316e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX2pnMyscXY4Ca
 ZsqX1bKcdtfquhItLBAI/gTOa77yQhq8tBz0Z5GlzdoyZu4SCJCZfKHVhnxhfj/gMk+hl4X7gHq
 ezb6yWyJ6+gunD0gUEYhDTE8LJqq6A/IjyzFqIjZskeeYM6pE05+aPx8rcFNMx/nmb1g1rTct8b
 FW2hYqj3t/Tu04noUzQLJHOi5Rwop7CMmopHp4qjHYlnzcYvSCUUdmKNNxKQDCy+iYGlZZbFcQP
 fdaCkygc2mzBGizDGBsapKRRuzXYLZSBez7YniTJDQpQgcbXv3m649J0WXhmxqGBG3j0dEV+O5E
 2b8pY1VS/WxKW76cqFjOmpahcERDaj+/Fz0Em53/FagMism3gVztQHPjJ0Hq5+OrHANMmLnfvKa
 XnWFTlOsKWPgdO8denE+KjwNa9t/69t+BwFVUyOrRtwD9/Qn9SIVXgnHWXh//muhpM8nxgMcfuG
 ubnYU7JzbXGOZzyXgxw==
X-Proofpoint-ORIG-GUID: PIB4g61LAhnEgBihuPlgdYSVoZo364rM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0

