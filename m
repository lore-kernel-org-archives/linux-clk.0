Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5634C2D77E9
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917319; cv=none; b=kgnBwmo/6QPmok8L0Zoqg0c4RmJWwEO1D8IbqHL/2V4U4Ol/7qoexfWJoEUWcaSFEPAw+BTjFt6ENXwvkCXUj2psdRkcawqgnLXmVezFqVe9xPOaxNvhRik3izYy3kIiEH9RtS6TlAmQatIxQhEuUne6SvoSYGuemlnSeIkKBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917319; c=relaxed/simple;
	bh=dvTz9pJnz/6yW78RczUv06dX5VWsbqoJiYlp+i0Azwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0cGaU4OhR90UzE1WUE/vCTxAzG7WYx92Wq8myTLgI3O9FZy/cpmWMyE8bzzQofgimyimhsDYUv2/aWxcHoWRaOxVJEPsVqxHBDXN0ilKMqA96Un/qwJGZozDuj3Gq4DOhhGXnzbohfOWkY76NhgXXON33GMED2hQ6Z0ReUf69Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfMjOiFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaytB8mi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfMjOiFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaytB8mi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UKqgEr1091578
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p56ol0FuHjmlarHhQHfqBzfwDmn8lvfqmM2KRXHkKZw=; b=mfMjOiFaAStTEIyZ
	AN+EEFYreoWuCSid0q9bqDblC9bRBhbuBpNPkY1pI2y1pMAR2vVlOpxhZikLXqOb
	Sg3ltiwy7d/B4XMgn8Mn2GUq/HQdd+g2g90WPVowYg4puXb9Y+Q+HvN5ny5iqQc1
	DtCRvMxgPal+m07zZc7/xc+DejjCTf9WM5zRmuvRyJ5iw3ORWcCuvOScZ5VUwvzR
	vPeR4xepml1fENk6dqki4mIO+00pQ4XoFCA+h+kvL5p+3mZoW34/x5Zf7+wwIh2q
	LIGrMyPTjRWII8PGIzyHo3vtwosV1qsVd3ZueIlsN36MOwG7HtjRl6FuwQ6Z43vw
	4CPRdQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd249v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 00:35:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so6866804eec.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 17:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774917316; x=1775522116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p56ol0FuHjmlarHhQHfqBzfwDmn8lvfqmM2KRXHkKZw=;
        b=XaytB8micYFEAzVeVGDvJ0TyyqQDMG+FgBX1SvGZRNHqCeVeFZyG9vxW/d1sd6NAvp
         RBC0BjBR5e36lGQ7C71yN6siARMYU1hey5ZxO7UAwzeGhSrgoHXV4EY0yFqrzG183UW+
         UaIW0YphwVYIA/P+hbWbebhfgbHkX/Z8sZAiuMzrGb5nIK87u7eV1Se5KGat+LXv7a6T
         jZVAY6Z8dFdT/RmtOo7sVnXkaGJxyug1rhOIci9wrV47+MOY4pLqO2pYoTu6S3fDydQU
         6Kd3wLLK/lWLtJ+hPMaSeqwkQGTvD4uA5b6HC8+YgwVv28DcURllASD9TndoM0+FVXOq
         z4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917316; x=1775522116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p56ol0FuHjmlarHhQHfqBzfwDmn8lvfqmM2KRXHkKZw=;
        b=cHj+cxtDYk+RbRkwDeMN2HWnbzyjSuGLNCS6j2QIviuLhe0Qpfo/lAGpxOJzvC2iBY
         KOWs8O3M3Yzc/3a09LWAz3pnTz2Kztqb+8FAMXED0zI/RDtJBQAF/jt4dE8zOnWeKJ9R
         QvRrWpJV/x7n+iMAeE4ISSpPdGYOhKxfRX/mfjsFp5ewPk6wMNM0kMd8xt/Itnql+XeX
         4sxj94FJ8D8BwO7WZYvfgLoX3rqaAzJeXTxvR5SBJRHDzRYbQFUyzLgqLX4V0H7iiPnN
         CSN/4y9jmLCHSVVNtD88qhBRVcuuiL/W6AYoz6F4bOoH01gQ07BENXW6y5sMRPZSjUA7
         6pnw==
X-Forwarded-Encrypted: i=1; AJvYcCX5n8TSdRf9tXo+AwWil9gIuBH6dZZdiZmSRN31wIQzIKNccMceFzzSIIJ82RVWSlpe4h808W1abqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSuNJIPxEQHZ7CYK9WA1T8vOHjzIouuKS3eY+QRqlEbhqjxkL8
	C1uE9/OGLQ8rb1jnGid++zC4uX12/YLQ2mWCcVZcL1zFOBQRvq3MZRIdqC8RYK6xEwCzSX1GXXU
	oH1smCrPYA4l0Iq9WKvGP0e7qS7Fyr7xT+7f7muaxACoXOW7AScrbeszREMMLYQM=
X-Gm-Gg: ATEYQzygHTaQfDdqYZaMgjOkwZ1NZZoLmfwC+9e72i1+SH21Bt2oW0kIxBinZriUCPF
	NrRSwb/XVzggrseaT6Ixi//YwSKcqKNnGynW0ktVYi4u5sime4jQJLWvXKMhSylOYLc0uf7POY0
	cul/yI0XPCoR4GWkG4/Rfaw93BrAj41GmCP9Q3NAnRtp3GQVt2klFLF0Si9IHC/mrooJRjMxuB8
	pWGDL0dzzx4w2AsO7kID34HmHkTyUUUDpn03hD/odJFcX1xmYaYgxGLVeQYcWp0b5sPFsW+3ZbB
	4rXQLmMaAS4E/kde5n6dQlAYJ2NRcjRkKcaYhzbEC2EPCfmeili1tiMuZeqpTQyerxUMpB7wyZJ
	HAktotmmcqsThNtpEGY0di3tIhfbTU1ANwR3K+ZyEmEAYWxEoAcwQbSmQ7JOnzOvR58oiAtctYa
	4j
X-Received: by 2002:a05:7301:1294:b0:2c5:76d1:7f95 with SMTP id 5a478bee46e88-2c576d1bbaemr4673554eec.28.1774917316070;
        Mon, 30 Mar 2026 17:35:16 -0700 (PDT)
X-Received: by 2002:a05:7301:1294:b0:2c5:76d1:7f95 with SMTP id 5a478bee46e88-2c576d1bbaemr4673522eec.28.1774917315528;
        Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9c088sm8454529eec.21.2026.03.30.17.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:35:15 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:35:01 -0700
Subject: [PATCH 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T
 PLL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774917310; l=2840;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=dvTz9pJnz/6yW78RczUv06dX5VWsbqoJiYlp+i0Azwc=;
 b=aN2dhRKbA7AEXirzTPHtVQQAafPxYBZake1aRDjykgzIB6yHNYW9QBB0GvKEag88o8d4lgukV
 /A8VHH9ZaHsBo4lp/GwPDMedg7XBLjXFKmzZt/VYuDxJcRbBeyuzKlr
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-GUID: ED7QsAhgM3b8uKO9C6d2EYcx7LF-DvBD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwMyBTYWx0ZWRfX7DLTiIjKHV1v
 9jhLYZpjWVIa+L3h13eoxGgvVA2Y5piQW4A/on5X04VejIb6RBHsRf9wm+Ect9pV0ndaDh/i7sp
 ysdsnWVgHnmlC562kE8lhEq3rc574d9cMcghTpZn21P1BQ2flIRcQzcWAVBjJ0adAufoKDBmUlt
 cACzE4eMJ9hvwZG32QUoSED8aOTb8BN42PHwyj5TIk2rA82w45ty/QBjoVHp+Isbp4CO6juELIl
 dpf18KTYQd555bYLyzyPmRA9ImnCi9f2Np6U6+flgp3hctmLFhrAe3Fvfgcn6YkaikYUUP8IGMX
 d42rTIJ9qRuceo//Bg0Mh98RL1HKxKgSVw00YYOIZ9sNSpGYAuwAcemSOpV+j8Svg9AGCC7lq3i
 qTe6xG47eyCVfLgq0OBSn6Y9/AKoTb3U/B7EhSE71Ng2akm2nIEiX3jbatQpAc8okf644SSDMDj
 9O0cgTihZaEU3gCs3KQ==
X-Proofpoint-ORIG-GUID: ED7QsAhgM3b8uKO9C6d2EYcx7LF-DvBD
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb16c4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Xwuga8JxpJPgM73N45wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310003

Add clock operations and register offsets to enable control of the Taycan
EHA_T PLL, allowing for proper configuration and management of the PLL.

Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d334492145..3a2157bebc52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_PONGO_EKO_T = CLK_ALPHA_PLL_TYPE_PONGO_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_TAYCAN_EKO_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_EHA_T = CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EKO_T = CLK_ALPHA_PLL_TYPE_RIVIAN_ELU,
@@ -198,16 +199,19 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 #define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
 #define clk_alpha_pll_taycan_eko_t_ops clk_alpha_pll_lucid_evo_ops
+#define clk_alpha_pll_taycan_eha_t_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
 #define clk_alpha_pll_fixed_taycan_eko_t_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_eha_t_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 #define clk_alpha_pll_postdiv_taycan_eko_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_eha_t_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_pongo_elu_ops;
 #define clk_alpha_pll_pongo_eko_t_ops clk_alpha_pll_pongo_elu_ops
@@ -246,6 +250,8 @@ void clk_pongo_elu_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 	clk_lucid_evo_pll_configure(pll, regmap, config)
 #define clk_taycan_eko_t_pll_configure(pll, regmap, config) \
 	clk_lucid_evo_pll_configure(pll, regmap, config)
+#define clk_taycan_eha_t_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
 
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);

-- 
2.34.1

