Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B03876A5
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090282; cv=none; b=mVAj/oomK6JgrAm9deqC7ACIBQKTAAcRfcCuD7qNaPIWuUzHEJ3fCyKs3DHCTPR/N6d2EDSPpgbpf24gbQdyPnIG2evATNO7ct1ERyuBpXaSpxicn1zrtpPjzV7Ed4iurT/BV7KotNBLEvq3vox2qxym3hDahoyR5cGih8+Nh0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090282; c=relaxed/simple;
	bh=XM9hB/URXNGn61ZH/yTKzk+yroQbXcWWs/AUIbcpmdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KC1KIIZR9lLwv7VIuT+6UmYkDMwU9LqX/t/C63oNQOdFX9F0qbZeUL7ENEs/sN2B7dPvCKMwovVu/Rpd7mLIVSGKKpk6Ln4EivjeuGoPLx4BgwszWN58Bp50SNwCRlOBbvpxiKhAlyXSu6n2V4saSKGcBsuGrFkpS/V465cL0I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajv8KJeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FH2giXHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajv8KJeU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FH2giXHj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V87l918930
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 07:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=90FpgvSx5KtfKkkXjvwE+nfk
	TuDUvktmJOzyvjk4Jtk=; b=ajv8KJeU7Jc5gDoNjTLK6GA0SJZmIE4lI4cMPb4/
	fn10H8xLApCytCIiuPt2CP9MgeXjXzj/SAO934sis8CMHB9vLNoloyqKADmRnSR9
	u47Kl0StA4FPKM7+H/+GGQ42CYFn9yoa7TMh86q3He2BlV6ejwH181dqPRPn5kB+
	mYNrteX4gQgdSCVTtgaJu2zjWAiP/MsCVmeTDO2W82XC4uMYjOMhF4o+l7G7ZCkr
	PgoXQbIW5nA8/hEE3+zm9ezknyv75hZCR9VPi1IvlAo2L56t7hGPTaDVep6GHf4t
	CA8sUgBa0XowpimfmOPmtR5pqLkbsyMdtiVjuD5rjC4QqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4t9hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 07:18:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3d11b913so445450385a.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 23:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772090279; x=1772695079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=90FpgvSx5KtfKkkXjvwE+nfkTuDUvktmJOzyvjk4Jtk=;
        b=FH2giXHjeWijFW6sYHrbhasQ/06ZG1IhrpZvLkopTpOTUZrL9tjj+L7j3xzEnjrQv/
         xLYMMBlSiuflaptAiJp1+QbIr+jaqGgfTUtTiDAoM5K3fQHXeF4Q0df6zazON04xbk4m
         6WWku2yQ2aP4+rmJu6KhJHgiCUw9GZIl8rGMhA4Lb0fTl5eW7Nuy0cPr7oYla+xlT2ku
         beuKHhtIGBgZbFBT6x15iaweRbz725xdEEjhKUiJjCR4tIiAiAwp9l+7hRCFjd5ZoaOv
         UxVelnL9DhnHgiZihfT2jTFs1PMgg29aqWXkH9nhMjM0ISreg+WsjAK8TfuTOrzSin1V
         5wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772090279; x=1772695079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90FpgvSx5KtfKkkXjvwE+nfkTuDUvktmJOzyvjk4Jtk=;
        b=eqliRCqKNPUDangYU/4bplynkEX3IysJipJe0zNt7zOnq/xKIEBdvd5k8VfQfzG40z
         Fnn7F3+Hp58fEBfJAmqoJ17qKTIRNaiGinjne1+e5DNsL0J93PtoiWwRASWFHuzCwXVN
         kWsqVD4RaAKyngvzFGILwddzmd+UM9Vb1g+AyJhlSC1ftpMQ/0uP6Jw+spTzcTqqWy0E
         /zDq9d7I8g4QWWeHFN3n5RMLDYY+6iTaJFU8t/k8YTXAxtc92KvkJRyuaQ+P7bvie9Oe
         nrUY3suKIaX3Gbr8oqBsUBZUn4A240qpvUPpLZUc08TeuACLfXo6YPEQfRw7ipdWj0gk
         HZpA==
X-Forwarded-Encrypted: i=1; AJvYcCVP20mW8OtL9xvKx8b4GO3ahUIOdylhP6Zq0Ns84jSECcmVJtUHNosSINXU7iRQyvGendSEwZWNC9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4I9Tg4yxK7qukSECuthNrelanR+O1BQ2P44u8iB708yJNhCx
	TbLuaZa5dBJQsHyZ5JpDOLUHy6vbWlQ7l2380Y1W4YmLjXM8BfP/wwraEhkgkqEdgBQ7InjPvUr
	xmxX+HHys98z9FfNIYCb7Vwk0eewXj3XSK6hd5JqcWWUMbBVp8PcCsUis178D+YE=
X-Gm-Gg: ATEYQzwESd1rb3208DGl8BpUsObClVe3gQjWTTYM+roWmk3VAhFuELZMeT4+nnTvftV
	6avzV3uEIsZVTBChttl4OvU9wyUZv4psJL77kBhMWSpcccFFcPJ2VAQOjoXOl4OZ3Z7cJIOHDYt
	wL+OtmaqzcfHu/HC2mIAlEHNl56xB3Td6L1rTx5ZhQeVs2v33MbKNY9p5bxSAqR/LboqkguEi3l
	EqzVX8MQDQe/W+H3XB3mv4wDOFkA+q8HgYfttiPqsodiYLWdbKtF/dPgfDmM584TAPfsVujWvv8
	4lf7dWr0V/ceWNgPh0Qq1jUPQwPTDjcUXMW7o0x5L9LDh2kimUB3wbNjj+J9xF5YXJLe8JSIsw9
	xU0m+zuaOz/U0wGfjVBKjZHgAnR+DVzYKGoKBVExMYV3b4hAOM5ZecJ8dN8XbTShYJr8IdpDJY6
	trk5wDCI3RX0KejIa6jXS81J8n5jESnsKyAYI=
X-Received: by 2002:a05:620a:1a21:b0:8c7:139a:bf48 with SMTP id af79cd13be357-8cbc1190e3fmr116305285a.49.1772090279487;
        Wed, 25 Feb 2026 23:17:59 -0800 (PST)
X-Received: by 2002:a05:620a:1a21:b0:8c7:139a:bf48 with SMTP id af79cd13be357-8cbc1190e3fmr116303085a.49.1772090279034;
        Wed, 25 Feb 2026 23:17:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109e33ae6sm464908e87.10.2026.02.25.23.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:17:58 -0800 (PST)
Date: Thu, 26 Feb 2026 09:17:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
Message-ID: <zw3wofbrqfy7jxpyergugyhuwswue5s4f5fe3j4kuaapinn5kz@czssyedtcqjx>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
 <20260220-gpucc_sm8750_v2-v3-2-6c5408564c3c@oss.qualcomm.com>
 <pis46xtmxgopk4w4kvu2qbbtcwchnbepaqaw3lbtfbon2cbjls@xjsfo65uj64l>
 <745022a3-ecfd-42c8-a01d-5861a9f479f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <745022a3-ecfd-42c8-a01d-5861a9f479f1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8cYdRcurUqPNSpTC5WDx7FGOklRi8lDb
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699ff3a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=EZ8H8NPY6tu1Lwj6EPMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MyBTYWx0ZWRfX/ofmf7o27cVo
 qZ/RVv85Bp14uVkhF12AZuleeE3g8jsSRa5W2eRLLpGdRyIfLfmNIOr59MvT0/lkhASCUb8KbEn
 b/8CeHPAE+Dg2YmWi823wry9gcG4oOnzWRYt1ff6TXhuEjCBUwmZ8AEZxwTQEItgg/o7EFpR7a6
 0r/P77lPAd0K0j24mz+KY9h7OFPetyYP3RGirfCfIEdtgaByqAm9tuZ49aLcprQS/FKO0s15deb
 ZbxOKckm8rimRgRfJgXBXZYFD8nHgzAp0BkF5bxGi1HSD0h7MvG5E7cS4e3wg2JQmffY1bCRSno
 jTREZLqxJi/ytfPkIoWjRBGOopGSVapNkjTf2WcefbFK5YdxnArpwBy831JFK76K4LmadBv4Fod
 pqdUtVZ2OFuhboRnuv2qxWG+oAEDhdbDohM9H9b+8bQkZfd6ZQGtuIj5ISzWJkWIuJcNZyZjZ8L
 m8iIuEl6yIoOTXdMiLw==
X-Proofpoint-GUID: 8cYdRcurUqPNSpTC5WDx7FGOklRi8lDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260063

On Thu, Feb 26, 2026 at 10:15:42AM +0530, Taniya Das wrote:
> 
> 
> On 2/23/2026 3:06 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 20, 2026 at 11:24:21AM +0530, Taniya Das wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Support the graphics clock controller for SM8750 for Graphics SW
> >> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> >> block dedicated to managing clocks for the GPU subsystem on GX power
> >> domain. The GX clock controller driver manages only the GX GDSC and the
> >> rest of the resources of the controller are managed by the firmware.
> > 
> > You missed patches for the gxclkctl driver.
> > 
> 
> Yes, my bad :(, I missed committing the change.
> 
> >>
> >> Update the compatible for Graphics GX Clock Controller for SM8750 as the
> >> GX clock controller is a reuse of the Kaanapali driver.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/Kconfig        |   9 +
> >>  drivers/clk/qcom/Makefile       |   1 +
> >>  drivers/clk/qcom/gpucc-sm8750.c | 472 ++++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 482 insertions(+)
> >>
> >> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> >> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..817b13f5e78cb534e165b09d95e70cd4a58b12bd 100644
> >> --- a/drivers/clk/qcom/Makefile
> >> +++ b/drivers/clk/qcom/Makefile
> >> @@ -180,6 +180,7 @@ obj-$(CONFIG_SM_GPUCC_8350) += gpucc-sm8350.o
> >>  obj-$(CONFIG_SM_GPUCC_8450) += gpucc-sm8450.o
> >>  obj-$(CONFIG_SM_GPUCC_8550) += gpucc-sm8550.o
> >>  obj-$(CONFIG_SM_GPUCC_8650) += gpucc-sm8650.o
> >> +obj-$(CONFIG_SM_GPUCC_8750) += gpucc-sm8750.o gxclkctl-kaanapali.o
> > 
> > I think, If both drivers are built-in, this will result in the object
> > file being added twice and, thus, a conflict.
> 
> I have tried compiling both kaanapali and sm8750 as built-in drivers and
> I do not see any conflict. Please let me know if I am missing something
> here.

Hmm, I might be mistaken. I will try compiling once you post the next
iteration.

> 
> > 
> >>  obj-$(CONFIG_SM_GPUCC_MILOS) += gpucc-milos.o
> >>  obj-$(CONFIG_SM_LPASSCC_6115) += lpasscc-sm6115.o
> >>  obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
> > 
> 
> -- 
> Thanks,
> Taniya Das
> 

-- 
With best wishes
Dmitry
