Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4581B3D6CD6
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 20:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247738; cv=none; b=KTspnAdVug5Xc5R7Ai9kmXzgpnsxy1cl9jTmnfiGFQKNSBSS75QXv71rFNlqNy7EHg0N6AbtEuofPGwKWI6cJ8SVytKV5Uv/b3/kcbv0Osfvi81Ast7W/LqeXwxPfYiKGQgcK2crD1DcCufM5h5nMsuqJbNF6Zb8GvWqmalcNtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247738; c=relaxed/simple;
	bh=4SjnT6Ka2wPgrBFz/satFg1o7JiBbH1/BvKbL6v/5tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osqgbK3Km9eckSaTbeI02Z9LIAyga+rJ9b4zvUjJ5Ugh6zFyGAFOuDmUsHNf/z/f59vwHZZiAv3JGSizjg2ov7ZWSPwGVSNCJQUQ6rEN1oaAtVluW+mnp59imKE+3+ar/GkI+pIJCNAifnqJZtfUOrxW0WD9e333Wxb7eNJQwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kb7FcMLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LlF5jqdn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kb7FcMLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LlF5jqdn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BomqC3780273
	for <linux-clk@vger.kernel.org>; Fri, 3 Apr 2026 20:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RdZetGmgxCBZzPnCNsE/he42
	0KbIxYNkzQ/J2p11Wvs=; b=kb7FcMLfm6Z0YxFAGC8/WySRqSedf6PrhUWXfCjX
	Y5GkPDivUg7LZAul2osId+lHkeGMHz21xDa3U86IZFFewAudjmZ9yFyEl5Q3cph3
	2v6CvN1m1xsj5mocFD+EC9TUCS2AC3WTJ9cz+ivEMKaY7li6yH+QwUSCyF0gt6yf
	l3/jyAo5YrxMblLZSu444FwYvwscgi/T147sqU5KQdjb951Qr4qQUWdiKx2sgI9c
	ht52dNYgoIqA8jqGFgT2GY65GcUetxZoNsHZSVSTTlTp2jTIh/dxO0LLbjaFGiEv
	iqVriMrw6A9q+2QOSlnaxAlWsfOxs0ILyN2JnkXA9do4VQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663jqsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 20:22:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d68dbb77bso22631401cf.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775247735; x=1775852535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdZetGmgxCBZzPnCNsE/he420KbIxYNkzQ/J2p11Wvs=;
        b=LlF5jqdnbYXz2GROjMqlI61wvgshhk1ca+Z9Q6AYrvVhrGsEwMxJsg3/2LNqIwVhxR
         Cx14vQQ4xl9f2Rggpgej8FWi0v2Q/054AUrn7K6n189iJftocBK4VnkfjLyGppYwiMx/
         XpJcOz/y/n3TO7qp2GFnS8RmZVBInLI2ZYkijTNnO/JGAbx4lKwO+UsWmSLzXRRg9zeS
         jlv5zKVzJZCvaH7lWQD4aOXO71jcGK6nwzEst//SiBcfU/+cZCVQPnmO4ssjl/VDn3zK
         /JVp2hR0/5ZTWszwCPt5AJlkEjH0ZXgU0FXPmdmMZyAy2/aabGdhZQ1BbtNhsyL512jV
         +odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247735; x=1775852535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdZetGmgxCBZzPnCNsE/he420KbIxYNkzQ/J2p11Wvs=;
        b=kZ8IXgv0iclUrdNLlBpkERvHI8+Hoc0F48WMSWyOkig06usFRsJC2Y9DlbAh5J7HEK
         mF8ky9NcEg39YIg+nz9W4Ry3hVn9Xgr1MB/EZ1V2eAU68MFFKXeHTdgD+GolQuZ7gbWb
         yYsv4oYDkBbr0dIhMbtSJpTJnds5mtkgNCnN3UcpLXaI75h4yYdM20Y52DCetNHSni2z
         CGl22Jxk40Cu9qwyn++e97h1V+2CWo2daKOjkCZ1A+AEAmQD1FV6ty2dI76nWQ87YkYX
         G/PBHLVQV40LqgsziXAAmyD0f4+MdrrLqTnzCFklvmsjfMShhwpkMSZq9JmsL7xD+P9C
         sFQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnqj5mSDMRvCok8svlf8benv3SsYmry0dcJwUexK3sHIVTY650HIdbMPvX6cMPx21g7WRHNQYu2NQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGHVmwveWUDfoBG7zb867FTbRhyUqhC0sv0CnK/SC3/6fRnAep
	zgXOaDMvINdwL4au9pF2JAxLuthYMdTXOMzx3qyExIcZenM29kIV0gh9ww1PqpUfAqZGqgdXUDa
	8ZbQXQbt8RIv5EjFqidfaYr6dzfhka6zf2896drat6H9/ntvzb+EdvT+8uOcK0uU=
X-Gm-Gg: ATEYQzz5mZw2Q5BNlMV48c6Y54uA/AD6MQ08pRirc0QQljQp+AjEqXMJKZz/J2KJADq
	zrW0zgpPEfFU/FT0cztMldWIv7ccIqyBz0+48CUZ0gAiuXCcuAQVXntRAy7Uih+epPtqR24hN8n
	LYhFqMS/p4EaXN1MVDphnd58uTDaHLotTIZNOcPyRb3ycMr4uyiYBwSVZkRcdnTtj97hvG7kanA
	Ptm0hXmdBbEWwhSYqEeqxrv7bo9H33uIDK7is9MwGVLfK8Z1pKtr0ik18yrVBsSyjAUEOQ3VsH/
	VgvCOAdlR7ePAKcTLQkCp+r/n/R6Cwq4ypPFM0lnJoKk8cl3x6FRy1M5rFlwhEwdY5z/SCxnVZL
	lEvVRktqQZKVytve5WrfGF/RpylpsCsQdBnsnSMbEvCuKBQQ6Kxt9ksxTDAFCQG0aEnqdMQRCTi
	WWB+Rh7KiIqJ77Rq9169UIfNeS/Jm0ntHnFyo=
X-Received: by 2002:a05:622a:1494:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50d62b4fcb7mr70216151cf.7.1775247735589;
        Fri, 03 Apr 2026 13:22:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1494:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50d62b4fcb7mr70215761cf.7.1775247735156;
        Fri, 03 Apr 2026 13:22:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc8417sm1649043e87.41.2026.04.03.13.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:22:14 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:22:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Prasanna Tolety <quic_ptolety@quicinc.com>
Subject: Re: [PATCH 5/7] clk: qcom: rpmh: Add support for Nord rpmh clocks
Message-ID: <hv4isa2c4tvbryofi7ahqvdcqmya4d4mujshqcj3z256mj5yvi@frjujwelis34>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MiBTYWx0ZWRfXx2VM63M4bQPk
 6aq3TwTNv8Ud5A/vDvadPcefLWUbtOmjgHuGPn4guxpwxlyfMGdFaFBmEpsDfcJlpVznSFnaIUv
 IX7bxLMuTCR8b3i2CtMLuMqCM8Mc3QudNNen3MQVvHB3d143hSSBTxf4PhGZncpbEA5WOiV70AT
 OcUbYTi0Y4tUwrUAqvsfYdV483Ooppn8BW/hBV7zE+0oedooS/VR62hD6cQNStIzYISvMAE4V7c
 V9xxbWGhv+yj2w0oL0H1+RUhd6RQL2kmwg2NbJSUlXgjRlcdl9/RLjFjYafRmcjvFc6lSg5SnFH
 Zvz6OlAeUS9JVGs61Z+PYh+9lNAblPdf/WNGJql+1HkS4UR6u+qlAazbsDsUeZkkShjGtFL6Z7O
 EaNsM5dOwFAsHryp/uJ8kOzgeYmPrWFemg4YrvmuktORSzn0miHDBPsV1J2/qzIRZ+PUSxi9AQT
 kF6y0Q0BNfrfv2Azp/g==
X-Proofpoint-GUID: FiETAtV1IA5zX8tYflANoedZhD9rnwDU
X-Proofpoint-ORIG-GUID: FiETAtV1IA5zX8tYflANoedZhD9rnwDU
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69d02178 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=tInx7QPNiEBsNJQimq0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030182

On Fri, Apr 03, 2026 at 04:10:53PM +0200, Bartosz Golaszewski wrote:
> From: Prasanna Tolety <quic_ptolety@quicinc.com>
> 
> Add RPMH clock support for the Nord SoC to allow enable/disable of the
> clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
