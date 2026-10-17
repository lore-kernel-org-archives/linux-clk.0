Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E178A3C4B83
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 04:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213129; cv=none; b=Wb1OURDurbyAoRlPVyH4UOvEfersQPMzaDytt31NQQ5nwG96nNEZG4r15ANtmXC+8cvBdeExFzmd3TOPNRThY4M7csWl4iDYvLTeJMqbhHrVi/Q4PHnDrRqzFvMAmcNpaYCjS+HXZaUfndZbJilQGVZUwLkK7pfC50tvJb3jZlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213129; c=relaxed/simple;
	bh=3qS4oD30KOIpnI14tS1ndzMw3Vxps/onCRIRJ9iaB5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFgcm2H6Tka3R0OAyRP0mgQ/jIvzXF9oT3Hwi5glTi6hKJHIu0RMz/wqUQ2XUmVs5nuXMosOqhaFKW5RAxxTKp89uuJF0g74TIXC/JTsdXCdZ4CZJcDVaXxo4LRAUq/Kx4ohyf8I3kR1y9C7qmOmtF3E+fJVW4KM2icOjinKP34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/h0ufaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJ9AwRqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/h0ufaw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJ9AwRqa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30ZOQ3938717
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 04:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HWHYeNhquwj
	AsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=; b=Z/h0ufawb9ZTPX/NIkHL/gOcQtJ
	nzGdDJG2R+iFJl8X17T3ad6BtegsqokA9O/m3u8WlOHcSYaUYWh6NgGMmkY+gQJc
	NRpLtjYA0ZSXuGXU42GOQByolp2YxvIlK+1OCndDRLTZwsQXFFwFtHxI3KPlV92t
	TTRndSwYWU+zQ94NrluBOIBNCnc/rByl3OinjH9XowrNNXNQu6RTZBcDNw7P6SDx
	iI//xG/7MEz0g+KblBN2bgG1h/7R+rCOeVfUIH6Tj0gfWSjgu/3Y9OZF2B1GXD24
	8+gtWfpBm4yy6wsUwdS0U7ZRh5Da31kWExzqWuquKfQ6PO8eEVVwrmKtV6A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxcnrfsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 04:58:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so1947778c88.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 21:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792213126; x=1792817926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWHYeNhquwjAsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=;
        b=jJ9AwRqaGahM2HCUQh65+XxH32TS3yENLP+89w9ysHbzolE0PRJJ8ZjgsaLK0s1M/6
         l26bgmstWuYwdcG2llYqfPzAYGJVcuiKjp6M08bYsgtdfV0SoS7qUyoOlvoG0l+Hig+Q
         AK/6IjCnWCeHUHfoFS2P2eR5DDdYzKwwFIPVDiQ8yLf3020vhQx3/zsaX5itFwqDfY1g
         qD69JvuhQBMMsTaT2DvNweS33dJFFjknG2mpubV7jeKFk9pW35c1/AMaGHgaz9okvSRH
         Vhc4SOEObvicCHhRyhiJ4nUDkGi15m20QKvtM00arwrQNWnYPxQaGt/+S+0+3pOmb7ba
         wDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213126; x=1792817926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWHYeNhquwjAsfGbT3Xl2nQfvQrvIUg9UcIKMj3xIQA=;
        b=xwl2UJh5l2wvQ3f8NC12BxEX7u9M2PA/EgfYsEFEztTlCcX6rBswyJCs48WdJA24g2
         hdOU89hxAl5CMumlswkav0XOSioX7+W2md3Nes1tjkGrrZSWJqp4M0f23id6Cb4nCR0c
         E1slQo+qF/t5yzgCd7KjnuNLAfDc/U5iI6WxDen4SuhGxHr/pPE0jfNq3oQFE2nAh8Ho
         zI97E0oEKNMZtURvXTZQgPKcAlUi+K4Z8EsOGm+Yp6UR44qty50AzjMu/iTaq3PQtsrU
         1vyEgwGwt7Nr55VchLD5Fqw28Q4P+wkF27ZWJJBL0WrUjeosE8ehCq7+onYwJGOEOG8Y
         lxUw==
X-Forwarded-Encrypted: i=1; AKwUvBwQlS7IdHyUjLoTsQLA4p+XORxnRDAdvQTvN6PvJSIv87bjgn3YootXWLjk/rVr7mGHZbHb+m96ewQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVARXa3/9nZT4SsmJtjvjLX3WOB3ZvTKcwDP0nEVt8PuIWFasX
	arkGbCyv/9PYZ9EgF+TnFTmCflVmHJCYjAfdbzfzy0vggA2KjaXTbfhLEZBqXrp07pVWnUbE86E
	DY35zS+pvYC8JyLJZNiKgHrQQHMZjw082wh2lDUZ2nQLQZm6CRlHcmc3kDEJyPCw=
X-Gm-Gg: AYBFou1BVwic89boEZCxtQigIzyibW9rUU8dyj0XHRteh1dS7hEKgNS2HkIbwpN0ANz
	BrfWcBvKEXXaB+pvHiQiPXWAs65420kg499bZ7MtFYYyVajG9Ir6BG7a8W0HCOExOqAqdCeN93y
	hxX2u3HCb/J/oLzsPbVs7f3mQFHLiKb43CPSgIfoQEtbwI4aU5bqijTFhi5UccW4wdtEEijhLSQ
	fERFZMPgjGS33rnkXYyN1OwuFiKzJxul/MwFccog4ENzQ5fQ/1B9iCWGvE4pASyAO4T97H20FT9
	Q/K4qW9Qe+T6zKIJXPpqSVkXJRkN4wgmSrj45uAeu/TktSaZega5tlUBhKDyQYNDoRJZH3wf3I2
	qcxZ3uB0yBPxNPI4zAKTBNmsY0yBP6U/eWds1hs7gTqIiHaq/eO+MB9Y5Hg8=
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr2956090c88.26.1792213125602;
        Fri, 16 Oct 2026 21:58:45 -0700 (PDT)
X-Received: by 2002:a05:7022:e808:b0:14a:51c8:e9fd with SMTP id a92af1059eb24-185139aa548mr2956041c88.26.1792213125033;
        Fri, 16 Oct 2026 21:58:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm15203817c88.11.2026.10.16.21.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:58:44 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Sat, 17 Oct 2026 12:58:16 +0800
Message-ID: <20261017045817.1506961-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
References: <20261017045817.1506961-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BNUmP1QG c=1 sm=1 tr=0 ts=6ad30086 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PKgm7S4WkqlbYhXdoGMA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: GDzFSMCl6qWJsqsyuudZY94_9bLFB3aF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX2GTcmHeZFRLF
 WP/Eu4IDAuS0FsLbVxAmMGoeQW5UOwB1Ba1/sTtf9FEh4o7urGuFm3nWhtfAYz2WfbHax7lJOmc
 8tuA5JqOb0y5nNKmun8UO866oZJuLlg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOSBTYWx0ZWRfX7KKBmUg7aiha
 lRauc72M98dIvIcX11VwdHfhpQJoKQhkmqL/mvK5zRgLJ57WsvxjfUgPCStVLxGCJ9if6Vveedq
 ipA4gTWls9bQuDHbbNgAPIsI6wC/XsAe3B/Y9KL2H7YuhtTsqeiw6SMINlNAOjPDFXEoFCMxqit
 8aOwHRb6AfVzP8ExYhzrY8oVRN2uWGBHOvm8OJHkXEBD/5R8tyWwlfRJkXYe5I45PCxFntokKah
 qivBCp9U4zZNs4CpetPgHvMgyl6ECa2QhAnF2zZ6jSUA/BUhjiktr/05AVlCyNuu62aDVK3gRNF
 0lvXtUlJMiFV5GkOsRElG0s3VSFnl5ryz0FqNMzOZziu7lHP/fGo6QSE1VCIqvXffCY0BmDSjSQ
 a8YSnADmnDKKLKC7voW6F+MnENhAKfE2wDjy18II7viPumpU7wPle1FRoEuSd8y/tlRFMEYkN7y
 Es+/RMgtnMWVRWT25Ww==
X-Proofpoint-ORIG-GUID: GDzFSMCl6qWJsqsyuudZY94_9bLFB3aF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170019

The video clock controller binding describes three clock inputs for
SM8750: the board XO, the active-only board XO and the 32 kHz sleep
clock. The videocc node instead passes the board XO and
GCC_VIDEO_AHB_CLK, which is not an input of the controller.

Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
clock. No functional change, GCC_VIDEO_AHB_CLK is enabled independently
of this node.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..678e6e167bde 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3338,7 +3338,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8750-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
-				 <&gcc GCC_VIDEO_AHB_CLK>;
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

