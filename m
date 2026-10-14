Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F934C6EF8
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979170; cv=none; b=YTnsHMd9ChF4CKCJIEu5tH74UeQn1kElM/DPIQyMZXYCLbjMrblMG4M4KYuI9gotCLn9sjn8Yvx9DhcVfDPoWdWg+qCIlrEtLrMT0XyIPK4v4oHEwMzmmb49VtWmm048du7OP3jI0F0wx5/sLl2TCQvHPaA0hhYr/z9cCQEApzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979170; c=relaxed/simple;
	bh=4yOusH5q1NIC2nd1oSTIsHSlVu1J3DzSXZ1Kg6T47co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcggXFjLJQNN19rYrKtYu62sMIdkSCFJLfbTEKKBjKPaEXYE/X3m5iJufpxuIEem+7bgU8SR2vEtxLBDDkOiYBLQbcbp5Wjik/piW3FB56x2+Kh8DvcvHgbE0Aihn89OryRCEtIwZ4d997zFvMwuGhq954/GjDQyPBBkxfRPdTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPxdFCpr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGdb7Jlb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPxdFCpr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGdb7Jlb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBRQHd2516002
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 11:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/uCRlVMAqy7eCFuaj3wXxfur
	qUD1vtPw5DJJFNPzZNQ=; b=ZPxdFCprxjrbe+0gJiTbbQYm8m4KelF3UKil1fTa
	zVD/qs9Y9uDpNHoq43qJUGDF7ye+VGTxb9+TcY+0rlj1Gds3R9i2qmFpDHv56JXP
	IHS926sjbQxiccn+xZXTSwdUkN2AUdwpWQjUME6Lkquyx1zdlCQmOTSYVnA/X83W
	0OcLm7TdT0he3d7IY6EWRRK+A4WG5YLV07nQBs4BZ+SxKxYqY/DId/8kl3RZdcCb
	kH4H2epvDKN9adqcQ+TnMmjNu/A0oIq60fBu6x9Fvdisu90c72caNARBJHUfBwkv
	L9vhW3YwXOG4nFZ65iQ9ZeTAyojF+2eloPGF3poXRxvpvg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709d9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 11:59:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso4609376d6.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791979168; x=1792583968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/uCRlVMAqy7eCFuaj3wXxfurqUD1vtPw5DJJFNPzZNQ=;
        b=ZGdb7JlbetpZpF5Kz0KruiZdiJzwesazWNsPeypAev4mxgfLH3e4YKSm5apous1LCc
         Wr75UcHi5makhcw4nGN5qhVAaNqAC8TOrO2stQrG+AJUhCM7CxQFbz0k5HetK9qAB3t7
         hms9uHsO1rgZDDvxbvxxHrsBhj+audpirSKO8U5q4vIdsUk3ppTQNsBSgfMn12mNqKj9
         H3sCBnjtM4qremxzH3GD9kPLSwMdv4dxkmPrBCPzjUME9OvxMNJbjLoTT1FWQaiylAqi
         tCiHLlefhJwOWqqa6QffpZ0hrEcrmXzcvN+GlcabEUxqSu2Vlq/S6mYcoMMqNUDEHiDD
         GTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979168; x=1792583968;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uCRlVMAqy7eCFuaj3wXxfurqUD1vtPw5DJJFNPzZNQ=;
        b=plbgQk6oQxHVPSneGCJRh+yW4OPIcaiXRvvvi5RbT/rmB+YUiJIZCfW0NHZ45+lbKN
         94x0QQfhvvos+XnnEk50tD4gdhGiYoPNp+y9tXyhT4Ivrmd5Kr0zD948eHe3gB2DNOFO
         YobImbc44q7DjEZ1szTvzUxT0uAQDYcyacnmrPrrM9kmSVzj+nTOyrNn9DSJuDa37EPi
         cWAxuWjWXI2fUDCf5JFFUH8lPUZDedBIroc/xiynuMOc8+DzLoOwTijBVU8SO75o+R6+
         b/ToD2SRkrjUX6ykNwe/g0v64B0w9jb/yI/B556dWk24jQ+4Wr/O/fn5VSUT76HZ88p1
         5gtw==
X-Forwarded-Encrypted: i=1; AKwUvBzDz72lVJyDA3Y+AtE0P88CQ4bxzY0Qd6gRQF3nE+quAoadMATkFwQvtKVtmuMTmALFFwBfV/oYFgQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3U/O9EDUP53lC2I/zcE8U8CJO1fbxFWMkVZuY4UwIPkj59MOc
	eDrYGYIv5IuI3VpI+WsScJU+SzA/RlHHEt7c239wB8Kj4/b8URwraegptOZu9TgoKj+zCderbON
	Uu9KglM8gvddwU8w4BadR/5H+bFO03UrQK5quZVlKdz01o0ivV9CBjYt77RkjBaQ=
X-Gm-Gg: AYBFou2UdsCEo/yq6PmGCb8Nrv4n6u5D8/mnN2YhMJFHALPGFRGWvBZjlmuEc8due3T
	eD0khvPgZjZWa9WfVl/v+vUXxjc4KjZ3mXuYYIRR8qghJBVmM8euVsCGmXmbwz448Z/tZ4bwaOC
	NB49zN24iVcKh22+u32FyKMnrnPZlqzR1K7XHLQs72bA7PTAvnyFR1TatK08NiEPDLDPxcK23zY
	9ABqQVWruPTiJvN3akgyefxBeEbWmT7tbHxJthiv5qqmpICBZXJDMWpMhM2O8LcMfdrJLFApqXB
	gi02gRBtUHxvx+IImBoJFcKh1kIOoQb0HQEtk1wJJmhZTps4o3CuFgO4PpRVEK0rpueABcFIOph
	vpac9mfOhIcaWUpV2
X-Received: by 2002:a05:620a:17aa:b0:93c:c162:1260 with SMTP id af79cd13be357-93ebd24a4camr2496251385a.38.1791979167471;
        Wed, 14 Oct 2026 04:59:27 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:93c:c162:1260 with SMTP id af79cd13be357-93ebd24a4camr2496246685a.38.1791979166650;
        Wed, 14 Oct 2026 04:59:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm348705555e9.2.2026.10.14.04.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:59:25 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:59:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
Message-ID: <e255ml7kf2pyjnw4k3ssi3jp4hkovw7x62cln6n3xbf7tz5q7y@ijqwv75233a6>
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
 <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NyBTYWx0ZWRfX99OH9IQxiQKt
 saV5tJiXVEmipHgTmhX8NQVoNyMul/hj/KTVsWJ/k6+WvnsBvnTcx1hFIFr2K3KYiSamWwDFlZZ
 ngi1citzRTRiNcv5hnGkxa8K6tpnyRHxYPQEkbtrlnSDbDG3ioLck6e/rVZqAOuRpXZn/Syjy5B
 yyddceS7VbEEYej2clK2NmD1JVTEBZ+QkSjyVQtzErOVXpdiOj8cLL1xxPAHYUIC1WqG1AMJPBt
 CLXHjH0/TRdgs3beUIkgBTAsUGZSjDSu3ogA7XmFyB+uCLkch7ID2Fq5J8CKt/nZGfQTUSWO8ol
 d0tnURb2PtIzOQbKA1PmaPSgxsLSHs32pSXANeRzqFit0MBwCGGIDkn7efh6r5BvoKEI8ZzNZPA
 2NOo4T0W6BPAv/affYiCcs6MPbKNix69oCzqefjzBGryfKpDEtddfxZMQSXcb6wYV9rgMDw/1Da
 KfVQyMWWJcXOVDT8T5w==
X-Proofpoint-GUID: iw3Nd3XTNUyK6n0AU4Cw8vH3A20aewtN
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf6ea0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gJZM9B_m1BTaeA-VxdEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: iw3Nd3XTNUyK6n0AU4Cw8vH3A20aewtN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NyBTYWx0ZWRfXx55FeJbsuxZa
 yJkR+dP6UXj5izKlOcIlG8FrRdVWkBkeg2oUoQbJckLoF5rSreLFSVhmdF6iiZCtkjyYyOB61LS
 q8UyXwqrmDCzUwQTJkGiTT6lmkA8hyE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140047

On 26-10-12 14:58:43, Jagadeesh Kona wrote:
> 
> 
> On 10/12/2026 1:29 AM, Abel Vesa wrote:
> > When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> > gets stuck off when powering back on, preventing the system from resuming.
> > 
> > Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> > state across suspend and allow the system to resume.
> > 
> > Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> > Assisted-by: LLM
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> 
> 
> Hi Abel,
> 
> Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
> collapses.
> 
> For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
> the below changes from PCIE side helped to power ON the GDSC properly without any issue.
> 
> https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
> https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/
> 
> Can you please try if above changes are helping on Eliza also?

Thanks for the hint. Mani's patch (v2) is already upstream, so just enabling
CONFIG_HOTPLUG_PCI_PCIE did the trick. 

Suspend/resume works fine now on Eliza, so this patch can be ignored then.

Thanks,
Abel
