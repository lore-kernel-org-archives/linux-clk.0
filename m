Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A97391E4C
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 07:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063987; cv=none; b=U105Pv6Pyfkt8WMn8hQ5abBj/PF9lgsSzEtoSgtr2aWjOezvCjrCVGIzG15EOvZL1c6iXNVVH8dbj22KjvfuHpn+48JsEzGHmptZw4naMOqi+nM1oy9r1tQ1GzvnTbi7wfBNgRx2WZpCtSpnDNW/BS0HivGbipsw6YZPp3O55sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063987; c=relaxed/simple;
	bh=Sj+L99sUSwTEyMi23gHzi6pYkjLLtkY9+6dqcHgqsMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXvoQgsm3vdWXWQJ9nRBXLUbsNiFqQFUPYFDIkbhVCD52dlkHGBDgKuFDTbtee07VEP6s74VNL4fdllxxmOz+CNhbXU9og06q75mlO7MRFdhUH/D+HzYL6zOJ6v8HK3uYHzE/WQ2r8BUh9DRZx+eJunUITY9LcL4xwecofXuhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnee/Qit; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CokkenFR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnee/Qit";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CokkenFR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CNMrV63657894
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 07:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3jjK8Nih47sl0WG6XxQVBWS89giyS6q5zzggrvFy6EA=; b=dnee/QitXFCu8iSV
	8ZIwzexSidJDDc7RR5nYRwt3cJ02aEDKOgvCukDvI9lDWnnulYnRpo7Ko0Iehr0h
	nwoEti2OKCuuDHpshj6L5W4b5zmrGh7OhONTTM9FJK3XKrUCxpvKsKQvWpHnJjZz
	PS7hnanBFa3dVdzoHKtbVJY9Gd6EaadHTUfgBT15xTD4gcwmSXiJUHa5NRNYtK5W
	vt0mD3HX6aTtzq0wdLI9lpfuGhpeq9uplsBzFu5ve5sorrJJg2L9E9vlpPE6E0Ko
	/C0wUJsP9dJbZRiO/jpCl1v/dDqrIxwcEvtacY9Y4CIR1QzViFQURJlhD1kBFrld
	FruzVg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyyv5gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 07:06:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d5de9deba9so4748722eec.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776063985; x=1776668785; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3jjK8Nih47sl0WG6XxQVBWS89giyS6q5zzggrvFy6EA=;
        b=CokkenFRW5BPVYu6/fchoCNZ9SvEUvLVd6MbDW6dSgjbO4pUNJm4V854Bo+tLiLEL1
         Z9RyBl00J3XAzvrTO3aGw15m1TEhcBmc+KtEfvf/EztzijwH3rwQ8+MUqZ0PmLrpISTn
         1L0p/270Y2547rX+7dko8Uc2MHSVkWcyrxCwvPI1gUvdpVa7TzTepST2RqdYm7d79ceF
         XvO5oj4MajkYpuNYSLQ9SZ+BIxDQmnRd2OLu2kfkFJL8x8ZV2nI4okNK0+VyodWNcEH6
         rzkIhE3jTPMaBCszzQEeVdsQjQAIzz4+/rH0ko2X3cvryc7jSQyIu3z7A0uaMGWafecX
         Um8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063985; x=1776668785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jjK8Nih47sl0WG6XxQVBWS89giyS6q5zzggrvFy6EA=;
        b=tLh1m0tRg7/JnAu9KZ/XhvRzEa1Wt1o8Xj7lndszygj6sL/zYwGL6u0ORTuYWYcVDe
         KEl/GWdRJYcXLWa1KP6g438iaiJJX/uzGm3EbOQDJ50xj0sfjtsWcKSjK6Wvo0elZmrj
         TLufn3J5d84fO4dEuI+IaPXarhX4C/DK+1ItozA4GL4yDdZiQuZqH2SISAxo/+3S+GQb
         TkkCeP69sFfU/S3xMDfBv6LaFErIaFbunPz1qd7afhMvgBdwqtVRsygTFDAPrQMW6Jmw
         SKLTZeFTQgwnfQNOlXiG4QRR74goB3vL5UXQmJyc4DlX09pw34eUkDp0YrU2DKp87L0l
         F3TA==
X-Forwarded-Encrypted: i=1; AFNElJ+aGyMw5AoyJqvnB4/QX62a5n6KRY8L1aycdfgvscIvLyTg41FNDVpYpgTcscOTfaXE+yhMdsVIfao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+D/FdYPqq2//7BKAbEWHyozhS/TpBggi3E9d6172DiCj0tdm1
	WJYbLMVpGgVnm1fXsTNad0kdBopv2h36ZPU7PpEb9y3TJGVzCg/5x16n/R2tNAlpMn7l9/gBauV
	VEuWA0ez6SnET44cEZ0JyvOwQ9qTt6omoeWnNtLzWbBkrmJ314PT4/3TtWXeoTvgxI5ZxEfUWkw
	==
X-Gm-Gg: AeBDiettGASTvXQPbKCNxoBemwVq76vL76gAdLnYaQ/Pz2VcPnMnSqYJx1c8w685unS
	EtgKQ6aBR7I1l/ztrdoiwW78KNgYV96HY2bC/o3hE1lQwWvneq8oIqrpe6TN0euNb5AsDubqUQA
	2qN1qupK90Mni6chx4eh0e+1xiU4/vPkMUcGcB3alL3PAX2mgOY0ttJ4pXiB7Pp2nSyK6l+AKbK
	9FvnZzOAxrJ/4mKFDrABvhD7YwhaSiU1zYomdfEyNWZ8+ddk6gOe3/pG7oY5dtKV2yjEq28+v0n
	NIhQ3BhajFhXKTPVADQZ7PBp9H4l2mWTJ1lsoiwvi8MeM/CQi06JWERmwUV8G/VWt3R4JRDHrYD
	lxeQhcU9osqYXxuCjgIEehID1vbDQo8+AeAG3wYR7pegnQSpFxS3BQac2O59e3XwW7v8U
X-Received: by 2002:a05:7300:269a:b0:2d9:6373:ad11 with SMTP id 5a478bee46e88-2d96373b109mr957557eec.28.1776063984903;
        Mon, 13 Apr 2026 00:06:24 -0700 (PDT)
X-Received: by 2002:a05:7300:269a:b0:2d9:6373:ad11 with SMTP id 5a478bee46e88-2d96373b109mr957547eec.28.1776063984308;
        Mon, 13 Apr 2026 00:06:24 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa5257sm15438521eec.9.2026.04.13.00.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:06:23 -0700 (PDT)
Date: Mon, 13 Apr 2026 00:06:22 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Message-ID: <adyV7qKQL+SJ6TxL@hu-qianyu-lv.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
 <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
 <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com>
 <adem2WKh2B-Leivq@baldur>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adem2WKh2B-Leivq@baldur>
X-Proofpoint-GUID: sn9XHpHJ8SOvBcIzt8NY0rkxhG4Gxq13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2NyBTYWx0ZWRfXwTOOrZgtvxRn
 YF95RV9DDh3uvJAivwInvwPvNld+Pr83KCzhYxMJbMaPoSQKYT0vZj7Q1u1SVSxCN9Na9lAffAc
 3mBnxmuiAUTl71rR9MxSTYsAcskfV2cOd3WNcP4r/L5lvHhQ1cHimBps5y03g4cofMM/qXuxHbO
 Iyv4mS6jkM4Zl3KVd7fybFcUwbyUUpxM8NnC/Tdm/oUGaFku0r1y00IhnUEsqSULVp2bzf1SjEo
 ttQjo6qej11yAOBKuPvmeD48FYMgcU73OY0z8nbANtE14verK8ZXOy3h8LFE1f6UJLkklYAvFvW
 C+rs/y78vcWsueP9liJ2GQF2pxduzh6Z1UDNKt/RCOJKrCz8qthGuRD70kPcVZZryyRD2EWQfNY
 gfH+C6oahPhaJLb/LHZogNFUWpSHQPQ7oTuYh/1fj+QBvpWo0eI0+Vi2RdybqJctu3aa5/CZmJN
 sdL7j1kGQgvW3qStTvA==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69dc95f1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P9E2af56O7jvyERa8gIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: sn9XHpHJ8SOvBcIzt8NY0rkxhG4Gxq13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130067

On Thu, Apr 09, 2026 at 08:19:41AM -0500, Bjorn Andersson wrote:
> On Wed, Apr 01, 2026 at 09:47:38PM -0700, Qiang Yu wrote:
> > On Wed, Apr 01, 2026 at 10:05:12PM +0530, Taniya Das wrote:
> > > On 4/1/2026 12:05 PM, Qiang Yu wrote:
> > > > diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> [..]
> > > > +static const char * const tcsr_pcie_4_regulators[] = {
> > > > +	"vdda-refgen-0p9",
> > > > +	"vdda-refgen-1p2",
> > > > +	"vdda-qreftx1-0p9",
> > > > +	"vdda-qrefrpt0-0p9",
> > > > +	"vdda-qrefrpt1-0p9",
> > > > +	"vdda-qrefrpt2-0p9",
> > > > +	"vdda-qrefrx2-0p9",
> > > > +};
> > > > +
> > > 
> > > TCSR clock refs are just not for PCIe alone, they would have supplies
> > > for all the ref clocks. These supplies can also be shared across other
> > > clock refs. I think it is not the correct way to handle the supplies, as
> > > TCSR does not have the complete supplies map.
> > >
> > We have complete supplies map. You can get it on ipcatlog. Here is example
> > for other instances eg USB and EDP:
> > - Glymur (eDP): CXO PAD -> TX0 -> RPT0 -> RX0 -> eDP
> > - Glymur (USB4_2): CXO PAD -> TX0 -> RPT0 -> RPT1 -> RX1 -> USB4_2
> > - Glymur (USB3): CXO PAD -> TX0 -> RPT3 -> RPT4 -> RX4 -> USB3_SS3
> > 
> > I only add supplies for PCIe in this series because USB and EDP vote these
> > LDO in their PHY driver. They can remove them in PHY dts node and add same
> > regulator list here.
> > 
> 
> The regulators are reference counted. Can't we add the USB and eDP
> handling here as well now, and then after they are voted here we remove
> them from the PHY?
>

For USB, I’m not yet sure which tcsr_*_clkref_en each USB instance in the
QREF diagram is tied to. I need to confirm that mapping first, I'm
checking with Wesley Cheng.

For eDP, there is only one instance, so I can add it.

- Qiang Yu
> Regards,
> Bjorn
> 
> > - Qiang Yu
> > > 
> > > > +static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
> > > > +	[TCSR_EDP_CLKREF_EN] = {
> > > > +		.name = "tcsr_edp_clkref_en",
> > > > +		.offset = 0x60,
> > > >  	},
> > > > -};
> > > >
> > > 
> > > 
> > > -- 
> > > Thanks,
> > > Taniya Das
> > > 
