Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB6737C0F3
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376242; cv=none; b=A8XiV8lXpyeol4jCMpUADK44hANLhZiuSUjWZkEgUdq0LT79NZavGbXH82Ar3bohJcj13Sis+PNtmD05pgnyFckijDrldr8ZyhJJb5RrkbWOs5sBhbaZRORrmGw2Jhm6l5kN+q0FptbTrwyqhBVTsgw8yFOBQJuVKn438wuH54A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376242; c=relaxed/simple;
	bh=kbRNN/tv2J3rKiiyN4xLMpeHmY7TIZd6B0cqKTVUBww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFGSVthgw5xlgzp6HfXH+48ax8DyTxHkHEaNEd1d/yG5zTyBHUELq8fWnKTdyqcg5Zln0rs98/q6T8cj/ydd11j1cp+trJOqogDRLVAy/Bbb/XIaKM8BZ7JDdxUEjlRzg/JGIJFlXGqbssz69tl5jACiLEeA8p+d2wOo/yOu7p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2KOqIdr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DP5Hbanc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2KOqIdr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DP5Hbanc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SACak12112521
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 11:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OSO+rDsc9UB5kYuyvWnZGSTS
	2+qL+UxF4AmO719r5kc=; b=b2KOqIdr3iY7w74gRjWUMA+Z18SyXm6a0/7+Au+P
	jkiWyyCnlpI9ERTJaUv8PrDwoTxCc4usdVuma7QT3zTupckKhvQRmc9clsL1q2AZ
	S5LDZYd4guuBPi/wrgkmBAXVT2HZO9KzgyLpAzl9+NbEBZKQSfyoD/uacF5tzVkh
	BdRYHPHN4iS5mrMgb5w+bhvj546A5dzetGysJyCpEUEjR1sqBDGni/7YRd/7Y9gL
	t555LA4vGS+pvmU66HhEVJTTj8EjH0qrPu0g+G5pP4X+jz8wE0kfb7PrzfhnarD4
	gcwd6NSAAb+8Jbq3earRlvabE6bG2Ul1rg1OXTMF8TdmVA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbka0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 11:37:20 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56eeaefec9bso11005488e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376239; x=1777981039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OSO+rDsc9UB5kYuyvWnZGSTS2+qL+UxF4AmO719r5kc=;
        b=DP5Hbancr7QKEttsxIKen209hUY4rW08llSx+XKs3a+/Ar+r50qxsZNDkqNvPCdzZB
         9dYjaKkMOJNJ/CI8TofJi6gD2SH5GeQP+Lxn57i6Fs08jjXxHUumccD4doRmyib5SEUS
         X2PM4pPtK8eDqfTPL854eGtDwBe5Jg6UqHSczJh5Pb8hTfOLbJWLghayuLKf+FZN8No4
         X/O5cXohT+4LxfKj+qLknlfswWnXRYxc7wkvNE5O/waI1ZBeg33AZTpKJdbuAOnd5dbN
         4Py9DE5w1efIS1RenqJkttuZY0tDilkvqWMmyL6wk21c4CMgh7moQT2Claqyi2dkAitG
         IWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376239; x=1777981039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSO+rDsc9UB5kYuyvWnZGSTS2+qL+UxF4AmO719r5kc=;
        b=Q7AofFI2FvyI+CzAOHsTSP2wBIZR4GjAijHu/U+xCtj0x8t/iWEczpeFTuLZOSatZv
         /vYqxC7Foj4/0mfyaEwBGkT713PKtKhZgoxBiAlgn4B7RPJhcA84xOh5Th7RiWfYn/qp
         zB3lDmi0nVWNeJBFyDuGnJJLNkhaaxF1KCLnCdcebQSGGp2/auKf5HYURcgUWmFy+N5P
         zSPbDvKo6CLGagCijNhs8HGN2rLu9lbsG4TKSSpUkdN6jeV4TI45ORCnAX4kfYHvOPxd
         +IIhV3NOY3XV40KEr7DZYH0bTrEfZshBZ+dEssFsYLK1WCmSOU40AaMGhCVTNjGLVZmX
         yuOA==
X-Forwarded-Encrypted: i=1; AFNElJ83c4fR8pBjnconP+4ipA7MhLvE3J542WGSKQubuvwwClGo7VQ5sdwoj0SE9oG9Xxl+sYFiQndHCA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnGIu0m7IyGZw9ahCvyoK2Y2VuNCNMAPLU9o1rOl5M1fAwBqR
	l8oxSkNXUyodkSPouzyDHwAQVVTh3tK6IKidlC/LrkhABsNEzAHm1mqUEHlVoVPrkNdbqgH9JQp
	1uWhnHnzMS0x6YR+x2+BrTKxFp05WGwo+jFINbDRpuA7bq5LukCsOTK6/1hL3D2Q=
X-Gm-Gg: AeBDiesXk8ifSJ2rqAEUjnaTl8O5l14rgL95Hlaz0H57ajwr0D2X92bPVsP1QFuUM70
	PCXXEfkTwBIjfQXOyyUxFBF4iX+ASv2kWxas1OMH02BLiTf7mdJ90zwu86ecqyUpn0kin89G1un
	gZuFp2AwSh6Nod0a0GB8IWeh5MxRrtRTTqNfSKR6Ma85geVARsAWE58gpZctxwp4t5YAbipR1hf
	YnRGIobUTTkZgcxdpUSny5ErDZsnJkl1yVdtaD6jQZddy8C/KhMoY6P5ksqINcL7s0f95iNXsIl
	VYVEzTQ9M4/9ynFklt4kDCm0Hy7w3Bc9B03fku5EGUyLdnKcPT9/iQq+zkoPWq9cIfZm2SFWuB4
	GtZ9wg+HBxil4dbYvF937EC0nAzyzULZAprANkda7bysuU8vZi0XIbQ3oAc0NfgfXKZcGLAMcoW
	tLZJjkHM8htmRZB7WyPzf1Mbpy40jxJfwL7x5y+E5bWCd3Eg==
X-Received: by 2002:a05:6122:2805:b0:56a:f576:cfca with SMTP id 71dfb90a1353d-573a553f767mr1005914e0c.2.1777376239001;
        Tue, 28 Apr 2026 04:37:19 -0700 (PDT)
X-Received: by 2002:a05:6122:2805:b0:56a:f576:cfca with SMTP id 71dfb90a1353d-573a553f767mr1005900e0c.2.1777376238377;
        Tue, 28 Apr 2026 04:37:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e3237sm6280951fa.3.2026.04.28.04.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:37:17 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:37:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop
 disp_cc_mdss_mdp_clk_src from getting parked
Message-ID: <u2ypsha4t5hrzjnzihut5zdef2oijkakl6nzeqr7nlzted3kpq@efc2geb27z5g>
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
 <ae-YlXZAuWqgPd-c@baldur>
 <67a51928-1c16-48a6-ac65-f67c36297e5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a51928-1c16-48a6-ac65-f67c36297e5e@oss.qualcomm.com>
X-Proofpoint-GUID: vxkbOqUqzvIUvGvUyp-P7tErSzFO_WRq
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f09bf0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wuprHcOFQ_25lWwXxKAA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: vxkbOqUqzvIUvGvUyp-P7tErSzFO_WRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNiBTYWx0ZWRfX7ifhGYvfijV+
 906127Tmf13xJkMiv8GY4gcEoxND0ZvhZgwBSVAm1+8MPh0268iKHbUZvJ3YzbnfpyiauCvGF2h
 YEIHF4DJVwEx4MqO0S7cVBDkFlYGUFHlANJ8ghvDpek5SIcykx3ZqOs+LJSMmTrFekPyY3J3MZi
 RlskIVSOtezrabRbTb9LEebf/BEbtiJhfEPapimEQIFIkCJnXIEP880ksxhrjSuKNhz+iZkqWtK
 bV7pEKFw4kOH4edNwBnKQvZQ4gwybnN4FWGypMHLyzIWTUBjX1vSb3C1kTjfPN4yh29+uSCBeH1
 ZPTU1j/ROhbo9R5QCuSYdk9oBk34K2OrSCo+cZNHJ4bzd2EKbiX7JvwQmtXx+vnMI5T4Fsouepw
 QReEhibIe4YLg8aBF3ZxiwfOWQkonfH3uuqMoVT/HGQrK1DzDl0MElJTQXYn4zCEGogHy7ut2Ib
 lMmJR0pcY4UQ4uvBYog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280106

On Tue, Apr 28, 2026 at 10:39:24AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 27-Apr-26 19:12, Bjorn Andersson wrote:
> > On Sat, Apr 25, 2026 at 02:33:51PM +0200, Hans de Goede wrote:
> >> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
> >> to stop functioning. The EFI GOP framebuffer should keep working until
> >> the msm display driver loads, to help with boot debugging and to ensure
> >> display output when the msm module is not in the initramfs.
> >>
> >> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
> >> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
> >>
> > 
> > Wonderful, thank you!
> > 
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > 
> > Could we attribute this to one of the commits that changed the parking
> > behavior and get a Fixes: here, so that we could pick it for -rc?
> 
> Ok, looking at the clk-rcg2.c git log I think that should be:
> 
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> Please let me know if you want a v2 with that tag added instead
> of having the tag separately in thread here.

Usually patchwork and b4 will pick the Fixes tags from the replies


-- 
With best wishes
Dmitry
