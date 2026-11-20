Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170133;
	b=LyQruo0R59wsJzNfHBnsVvraMuPmcWH7C5xR+HLKYP6y7GS/V+28L1ywsqY0/NqNdYDN
	 ogQstVzWFmql6Buz60dhV4EoakfJdJfVH9pACefKP/4n+1k3I7NvMYnCEScq8lL9XamNC
	 +0KxQ1kM5I6a9SqKLP43ulvFm/7CiyupOjnWROxmQLMdnTDm9IbrPhROhyYVqI50tpB+V
	 cKHELvnSGcwNU4RJarPdW2Q/IIalQLETtCCLCu/OKeVnWkR2hQYwCdlWsWlM2WWzOaVbn
	 hyb0zqQt8eyMUCCkOJYUEH/RRMF0HgIs4mbYVuAZLFJHpbL+fYEE33A/lE+ibdf8xmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
	b=an4OzIH9L+QQKR6s42HqJfxELGb3f93cu6DgebXkvofpiX9MjHZ56xcfGoqG5u6K37S9
	 PtAFRQVmmHr5lSgPOvU+Z7ilrTxXKERxuTZk+U2xYeGaoO32wHRuiGhqGX1jtoIOxCaW2
	 sE0VwyUikFAyS/11x3xDtZTCZavemJley9iAQk3MuxNYsgTKjOskeSDpqtxdkZ1AyoXK5
	 j57Rb7nfco26OXulS5MfmlN+EZtKEl62eSXT+xWnSJvEZ+9Jm/QnklRhOA8Wc7yBkMiQ2
	 G9SHa3hS3TWC2NTfK8/kikr0w6F3ra8GWIUy3L3/lq4fmWNGI70qsMHpFm4y3mcLLXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF3860A2609
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF3860A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f2B41112287
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1MGMcXxwJZ7aC9YYQ26OH+G
	9qkkBjw1QsP0VNbDjno=; b=YEJ2QkekzsvzilqybtrIOF17/qu5tiMJz5gYXq2i
	HFShxDd8O8TMOBOkrs7njtl6bDfpWdwuKea9Q24JMTx9P8lJdjWKehmYDU+PNtik
	ztS4KTSOzgkKO5nylH2EMOUPcfTU8fyWF67Bk2oHWAss21DgNZ/1kF4AC7AwIUmD
	05HxTLs/r4sTBFOOgNwI8Nj8TDohDLI/1aA3EoAfdvWx0ODmOeLTH7m31aSEuRBf
	ihQal+uRFTomuyo+Tas9ZZ8zKZFG86yL3lk5tjOoglZkI8UFmG0BiTrIWRRX/4cg
	mqTjVlIDiyWg4hjDu/Vw4MluqBu3qEvAufJyjIZHNmDz1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsaxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53639e47be2so15102661cf.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170131; x=1795774931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=eWOo9ers7osRg2E87cOLSOUzN9Mr7Qy4uMu5swGFJzBnqLl4QHUR2FGhMYNEDfRnAS
         VCCvW2Lhb7VD+bo9VxG84uoGq0Dp3SCQ1zI6dfxLshkb+n726dnJM4DqjkRv2hoDeO3A
         rozocKOY1Lwn16dyFg5l3obFE83VeTD1gN7+9Qq0ydqbeorBPO8BtT7xcwqPxcPbBGdI
         bOfEk8DspeUd9fyQB7UyHM2gAZjdHCNZtAp8ln83ustNec6D+h+EPly3c3BaCKEXeLM1
         3PmRPpAVxsDmQx2vQjIgXGBdH3ZE2THQD4ZUyVHKTJZ6gRCUchj9OIpBscglP12kZD5+
         KoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170131; x=1795774931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=yUPSKvUhEcQp+OHBcPcjN9mPfUgGCblAopWQbzzV5+xyPlhlnal184eoqvZCvRuirj
         Hi+/F1i3yqGDNJlWO72IP63z9QyOOJWkuHySCdMhMUrIWUoec6MNYPi3bLDkjkbsatsQ
         QzGx/zqEJLDfobS5yvxY1E2HDBcR2DeQdPXeu3jjI7OeG0whfhMqWe6gk7r8xFkKOi+u
         ju34gsMZGV9xn29t+AMSD01XlKPj8feSbY8UmUR9NImeMKZmuRL2XJTqP+DuXz1jjo4N
         VS45nDp/1H+YBFGkvISWGQNNTA0LItZdilK1bFRJlzek3LaYzPYi3JY8LDfJx5eAzna1
         UKcQ==
X-Forwarded-Encrypted: i=1; AL+hErGSMepGZSPXp1J34ug/eaRQWEl9sudDfNUDiQXGpptDAd/H8KXiSTBt2ea/vjRO2l+POf/J4lMm/k4=@vger.kernel.org
X-Gm-Message-State: APuU4Z//U9Lj3ulF50WltbrWXIDC265SelRQ7LfA4RLM7lSWQUcKUwI3
	9ptULCGXQiULHUmFOaFCKyjgSNmPoJ1Q3D3ijkm3+muvCyiPVTYFbzHr6NFm8JJc43kiEDiPe6+
	0zc8M1eFY/xfWGUgiKTpijBRyaB3gkg5yZsilZncIQnzoM9dbzFbooNAMjAN6HoE=
X-Gm-Gg: AZFdTZei/GRe0Bky67i9d9nqI7urhmGyiyy0wU4muT8IvVU09exZl8m5GDDC9Yc6qkf
	hcZhAZ41fXkN+dqo2Fcd7O86XfdOseSeE9u1efxscc7gTuPDt+fFZlIVAAMRiUlR1ZR6tkAx1gZ
	++6Cd9fQ14QQRHJyF1BbG9zL8XtiQugeTlI86+3FG0LUgk2GcAzypB6qljHzOYFUR4HimBFeexz
	9ydHtNmdNYFOisXhivaZWmPnrVUGjnKP5+TWXg8+HtwiE26btwVJVVv6zI+8XVVX3OfSVHcU7Pm
	FS7oNH8AxyHGtedih4XORQoHGSyyElk2xyCN177eDVLTY0/YDJUaZtSJcHXX/CYBDLvNichIJir
	4dv8mhQlwq74RQ2AqIFtM5oVzFKlAHqOSe+tpbmhFnkz+hIMWC3c5xsezOUqZOpO/
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563571cf.23.1795170130538;
        Fri, 20 Nov 2026 02:22:10 -0800 (PST)
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563001cf.23.1795170129811;
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm3906179f8f.46.2026.11.20.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Date: Fri, 20 Nov 2026 12:22:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: ipq5210: Fix xo_board parent
 clock
Message-ID: <gejgvl5guwsdfexjqnq7aafesxjn5tjo5xc6ireh6xxi3mkt4y@si3fqc4hj4cd>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JpoaSmDBHOj27lKnWfDkPFXxO8l1yLJJ
X-Proofpoint-GUID: JpoaSmDBHOj27lKnWfDkPFXxO8l1yLJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX6DGB6H94z1FG
 8/G20ZDZhj0beu4p4vg0wkC8RYeI7n1pDZGYKnJ/jn/N5ifBppURxACX/NXv2HLrWCKtBBi49e0
 c3RX6tWB/+FZwh58zlucGXEizhvBkxx+k+GzmfoshD0r4GQQEjvwndNGlrHU1SRC+sqtqe3pdui
 rYxT2cm+abqcm3mvwWQN2e4aFRf9aI0lCs8P7L2c641b50HIqEkBSjIZbJEsYGS+IJzbgbX7GH/
 M36p5Y4MgrI942lzBhhYGqRP5Wbf5UocUx3cVO3yQAxZQeRRyJmBzIuTOnSggkAGsapkwxU75hH
 AKe2im3WZfFQpbPKyvTircfdsvQmXb3oZjpXTIwPkNMo1fL9Z5FFObl7DuubsD8pgoohXHfUDBC
 mEu8N1CPvzyBflF2MQaf6Bf9sDRA0vSTpO+oOQ5ydrlyCUMiFon7XrLvI8SaMlD+8zJwgpgcz47
 ZPA/mfJavLa+sFjS8lQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b001f53 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M5Hs6WqG2zr0kzIIc3sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX+fL+QfcVjjRP
 v9pJoXbG4QcXmFlzvGT5E4uFLhODdEhV06rs0O7RgW8oHcW1rjlD7zWw7ZwUVbrQhTDGZWgp6so
 4ryCiftT6DtG97zhLS9XOKq+VHhF+ZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 02:19:48, Luo Jie wrote:
> xo_board is fixed to 24 MHz, which is routed from the 48 MHz WiFi output
> clock (also the reference clock of CMN PLL, ref_48mhz_clk) divided by 2.
> However, xo_board is parented to xo_clk directly, bypassing ref_48mhz_clk.
> 
> Parent xo_board to ref_48mhz_clk to match the hardware clock routing,
> There is no rate change, where xo_clk is 48 MHz and ref_48mhz_clk is 1:1.
> 
> Fixes: 1d6abd242b45 ("arm64: dts: qcom: ipq5210: Update xo_board to use fixed factor clock")
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
