Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB9337F733
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707635; cv=none; b=QvurNbO8OL+sCNYxSXIRS7pm36DegMXML89gsRcCK6bC7y6C+Gw8EEJWNDPkkBNYnaEINx4Z/UQqYvG+q/hlpRK2l6FvfivVx3JzMUK7rrCyZM2GY2BLq3KuuUsP2p2+7+Eap9FtzqfaPMtbZnI+o6HNZ0MHgMz+yM01malfQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707635; c=relaxed/simple;
	bh=FSL4P7O0X1xNtnH7ooNyT/DRDEXy9s/ZlSMFqEbPEDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gE5T4P72jtGxGC/AJ8Em/27YP7bxwuqyJu6odAYc6JO87WoGCwdFPDpmvgXZ+Vq4u+F7g6rQK/2RsJzD6zzRTShnwlOjgsVqR0zOwT6KoWRjVxTtraiunJOfYOcUlrCgA4QevtZtxg1rmN0hXuIN/EziuV8+7BIZMEiKtp993vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5Gfb5//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IB2Xj8pg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5Gfb5//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IB2Xj8pg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QRLk3063478
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1c/8HKj+BHzZE5YaarXghzDZ
	Q9RCYcyLQSuiliCSSg8=; b=i5Gfb5//OFq2kUm54IF3leCGsAoRElFaOmqzTqHE
	4LdtnZmd/ImQSr30gS/SNbn+Dp/cUywi/+Mf7K1rMAcXzU1A7HLlx5cIpHhLn9pC
	JxGVl5a5sMslXTuiuyjFswNF1MZkMPGekUGZ+1QV+e1CtTprcBICJyMDHB29wlFV
	ZJUyLUt6oS1tVc6U5N7svrc/Aly3z8dgck8ZM7OR4t98HW9rAWStQsJrBGby+qog
	XimCGYGLkeFSXEg/Tk5FoqKe2If2mthXyPGkHsDv2DULtWBp1YThMgS3n3DijFHU
	Uyrhsq6iuadSl0OqK4daKp4OPCxaFv2BvA/dRaq7Er6cFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1ggukv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 11:13:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf01172bso116788321cf.2
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707632; x=1780312432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1c/8HKj+BHzZE5YaarXghzDZQ9RCYcyLQSuiliCSSg8=;
        b=IB2Xj8pgYT2kWJYtAg9x9PfdUcQC0MiUOU9FrVT3nflY5KH5sLdyP3A3NXZKVZKQBj
         PmHK5NSBnYsM4Hr34YnfjoiI6ENlLfMN0tQMGDL1DZXOB9TJ0qUvMy+5TjVorg6smd1n
         LiYn1V4Wr1ERsw/vQhyAByiXcasNfitt3K6OelObHwAkezHlfzvBJF466HlIFa1O8PbS
         UH1BK6+N3ig+8GGx4BFBrJHLZ9UPDC6Mdzp4vzqMUG78Y7UhtQ5g5y4NriccwPAi9+CT
         GlZzAqpztRZ6kuofDvw7U41KVqvE0ZqlyJMBwdabbf322iDQ1x0y5ISF4cG+DRTTEZcV
         X8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707632; x=1780312432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1c/8HKj+BHzZE5YaarXghzDZQ9RCYcyLQSuiliCSSg8=;
        b=XeqOlhzA4eBEEISYAqaNftBjSc+035OW/TKIUpyJ1g7YZtCI1YLUdf8c2r4ZOVgUXx
         AXWHrDRTeG5fmwnyz77E83hZ9T5t+NLgaeNSKkaSEfYFV9ri6YhQdGkLeLwMEqa69G3L
         5ONujWbcq8jp//exB1KHENNXfqYZNKmWhg1n/LTpKEi5vqykVvOrk1N2TzjRMxJ5Ft5n
         5RMlS6cc+gZs1hIA4g2bKgiC3H7LL2NS8yl5hPRdQ4HsQkoUpTQCwECpKcCbSzlrJuWG
         Eu85guN+brtW56DPKI6v50egGOSvy+BcVh7Qp3kRPq6ktkwLQgB3WqhljUq160e6UZtP
         W2KA==
X-Forwarded-Encrypted: i=1; AFNElJ+wl3FXpLNhwU7Ylu0RPL3Y0UvXzw/h9cLtZnP/2j40fSSxoYJMYJC26UBykAzfUA3nxJ9WxwYBFA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBcMJwMlhN5ybLWDvefebZ8bD0slGCE/2AgK6bQoISyYEKYHjP
	a50amNPJ46GRJhpTidPmcQm2pWv4uLmoGtKF0B6xs4TKV2B8Cb1daJjlksGEboXJ+57J1H8C4oP
	S3wvV6FQgPB8ZQg9ZwMM6kUF5PIHcDwGaeMOFu7wnOzGcLrbnTXIVrLVpm+LjR2U=
X-Gm-Gg: Acq92OEJQio7AaWqLqAuoDNN84VaQ2OjGk1k/0qdrRm6wvlk/XFETycIREE/jQX0JUY
	fhd0dk+HdtKsBGpZMjK05bqP6opNc5MUqK6kwM9etztO/V5cUadGpulBz9kRmBBsx8XXyS6Bbjs
	vPCfchSlAsviCRDU0+0KCVhnEq8gYOOPRg7KUhilyQJ4CzX0GPln0vXGHKnEi5/w0mmAZKARhDs
	JgvIqUvPK/1cwnf047L8cl+kTc/TrkmnDlKvhVvpKafyt/7i1zVv5gG8uO/dw11k4PcNgrgWVCW
	ZvIua5/nRhOwRu+Ui1nqjfbOOq6gZJfjRhF6qZ84YNu3MubK3+IqlGUnScRrhNYFjzYC1GUwuNG
	GkgWExIFi+A2M3nW1oSa0dMDWRKxP8NN6H1jCw8TFJNIidhjmIpoJRAruBMJoVYq4sC0lEk38bX
	MLptlGR70zN95OVraLkSrI1Er+aOohhPt8CPA=
X-Received: by 2002:a05:622a:2513:b0:516:d4b1:48cd with SMTP id d75a77b69052e-516d4b14c3amr180285701cf.2.1779707632294;
        Mon, 25 May 2026 04:13:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2513:b0:516:d4b1:48cd with SMTP id d75a77b69052e-516d4b14c3amr180285331cf.2.1779707631854;
        Mon, 25 May 2026 04:13:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7853esm22973391fa.14.2026.05.25.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:13:50 -0700 (PDT)
Date: Mon, 25 May 2026 14:13:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Message-ID: <u42lv62h7ps35zwqzxxmk727rmnd4ql4zmhb65q4bkjfwhi4f2@ihis7lc7zm62>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TBVr2Ez97xuZNzYYMqWjSF9C0OayaUwW
X-Proofpoint-GUID: TBVr2Ez97xuZNzYYMqWjSF9C0OayaUwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfX3X1EbiB26CgB
 cWrBpbcjmkL2vxebHHUICQ1I4caMTTPWBGPsRdj3vgdQIfxqzmaTqSEFuREjODPKeVhlCZbYCrE
 lhoiGl0MpsbzmchN3HrKLwIyD+/4W7EuaYplVQmQtsnVeuF9JwDxRNSsO/dnX++gpnd9lm2MJQZ
 0K8LlKpY9wvV3UnX7vPB3TquH3ozPrG+hdWFR0Y9UGaG5/4/fvZTT8Pje4EWJ6MMPPxq/+pbAiI
 7DHvztKsx029F8GEHivbofwD9hQWxIqq/Z9xWRKZKaAkO+hgdYiKE6sBgcGCsQXI7kOUI5QqHbq
 H3VrxBbN6xRVVyI2pF2hcXF86lLey/OG1HhcDH07ntBE+CajmLmq4T9x7I9yi8I5Jom3Ve/XXyB
 gzP7smp17HmlAc9OrhWH9zsikZuIS30R9s4zkngg3tQXtnBM/OVZNQPuZny2n9cAQMH4nUgVPDp
 hV7LOZMPwcCi/fL8r1w==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a142ef0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=h40nfcmH4B8cT1TSTS0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250115

On Mon, May 25, 2026 at 04:16:09PM +0530, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
