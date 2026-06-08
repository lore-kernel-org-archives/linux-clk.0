Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7696331E84C
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 07:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904601; cv=none; b=A038xzE3RtT0reBrXOsg0uiUWKak90fZ+6G/WtDWU8tnK1gEHNfQ3GjGh8KQKoqK0vVN4Jzz9ZxZ4viD+2fNbV/+mdab/wH2fQBHD2sfZBdt+GG3oaTFDOivx0+nKDvZPUubHABMMA3vCrw8+qwvUqr0qfRTrMt1hNcKFKKUCnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904601; c=relaxed/simple;
	bh=4hQUxTtMRcASgxQhEdcLXjPeAqB6RoJLxe5yRk6Qw+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYAVGvKWVh8AGPWkGLqDYbmDt6HXQhMISV7Hi1EmE4wuYJRd6xO/XKVcXKv9h/5cXMRD1rpzxSk84eu8ALvoPUiT0g8j1rmLZWop6RdNmpKcE/o71uuqhqTtn/wq/x+0Wg7Y5u6Xal9rGnvfyvrhv8hI4x2OjdTeCh6/JMKaBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d62xLF5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtlxhjZ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d62xLF5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtlxhjZ9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OuFa2347374
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 07:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lzanvTcCh0q8doYOmhmHVp3T
	dYAexlh2DgB3z98skOs=; b=d62xLF5cNy8WAZ7WLfq5wVmjiqiCbtbDs+eidYJl
	2J4J/+UG9Mbmk01dDZN6NtnTTY9T2jZS4U/GSWltm9e2nELKfn5cPixVibV3jjWl
	6tdNbw6duhx7yRgBA7g2G6kdJOq8zUCkBfS1FxrsRuwoI6LUpaDxnDTS8h8Oxc0G
	11z0AgUMa47/0o0yv+X3KqcS5eaMx0e2ZvdyZkcXMPDihfKTOlvKxIQbu7nfRDyR
	WP0zXDu20HHXe+PfsslOssJ5h4UfqFDUS+NnjVZQKxDzHfU4khcZW+1GPy+11WBX
	hhP5ImhzP/IHyneaR/qKyyT0s7t/UhtyuH2Dk9X5B9yNAg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrevb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 07:43:19 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7e5ac77so1598088241.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780904599; x=1781509399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lzanvTcCh0q8doYOmhmHVp3TdYAexlh2DgB3z98skOs=;
        b=KtlxhjZ9MNarNAFlBuy0CTXonyaHoLL/rv7oEXBD8S127M0gPGAnoaqDKbx+xXAFxe
         /LRANFN1HcFiFFAWnMJv8M52SGSeiOXqr9UCL9b424kRLqKbIqs+LJsvvG1mSqHpnoEY
         52CTTADhoUsgoYFTsY6u5x6VvFDM3u3LZbvG6AhIDWA7EqNT+DFaL618e2qG3eGFelSb
         rXKVF3INRUSmuf2mK8wUi6PDE+mXIbftT3+XQHT3FegdISf/psgN+OpbpGqd0pPECrsc
         cCSQ2OvYXYyp8FeqAu2Qwc2KszlM58zvAY1nyuunCufPF7/xQlptF/c3BjQEe9jZLmSN
         jsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904599; x=1781509399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzanvTcCh0q8doYOmhmHVp3TdYAexlh2DgB3z98skOs=;
        b=r1nqjPJP2Rk6a81LgdGF9vAXV/o/HrCBYulSzpHU1DnpCLkulaAYXEUnYY2qQ4vWfl
         5izhaQYZi/y0723pCOAWcnqsXRx19f094/QkK46zSa8EkNyokghSdU6Fo/QtoVCDdg7/
         J7jGu+mmyFb+s+LYye17Z7chEldoNtCnxOIpLTwE3UsiTgiT15WvNNrgf2gjRzmOeKPw
         osbM4uA7ESRbSK7QKAJcBkExf3GB4c95ykRY+wJfvsK5+iUFbTw6hY6bYFwe/LODjEJ2
         xJ3iuMvOCOT5Wq3HhhLCY09ELkppXBgCfL2Oubo0OwalRpGw+XVol8bLIhGZZYRKJwVe
         2wWw==
X-Forwarded-Encrypted: i=1; AFNElJ8afuGE67Th8s7R4Frqa2yVQ88rfqSgi+qI7SqtUAibzH/UB65tb3HVN+4W/M31KMZt2HkAUEqB1rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWHRBYjOP01PqSIkuBRW4mpbBPLiHaa6t62WZD5DODITDJUpP
	vIai9ctrAO5HpgxYWvOmgv1z9P+mv0nBmPza7q8tgoj01s6xA1WKrpaM319EW7VuSmUCyPur8CL
	fgkKTxu3koVyfY0eAL7n0vvv5hyZrLL+MpJIjVCjmoYCCY2AN5/2ML8h5vXNFaoo=
X-Gm-Gg: Acq92OFnhq/K7NVinBy3CTxOTYzooq6fmBMntkH/662MuGNg/TGEcaLd2Z9mHQOfJ8D
	HnWAafn2OqS1xuM1ysIyhsa/jwxz4QfYp66HGekYmYoqwyGgWDtTY1NWvGKBqyKjD95APZDGZvl
	IniqY9ofkI9hIjQLwpoo9MTkHYkc4+bHmaNa3d6m7AAgVXWIjMo32ui6zzwxsAXEM2WwXcogWeI
	30lmQNmzqqTmALslHN25cAaj0pOCO74ntzetdFfF6hnJ5KKyUOhPsWzhPxOcqcBZEwTdX9zglh7
	EqChMyUG2WDxGGSF6PK156bYNRHfRJZ5JABkX6Gll2UdrumnihrDWlwZjpMwxm6/xB29a69OhQj
	ORyxnVu7kOTHiJh6IgBf43Mk4hsDlWUR+FBnNuV+fsmFvHmKVtwgJ+NIDit/uqzz8cnqfYwZbdG
	rTS4h2UvU6u24IcVwVSFDL8rKbqiSY10PvxBSlSF5Dz+D5Bg==
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr6473034137.24.1780904598397;
        Mon, 08 Jun 2026 00:43:18 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr6473031137.24.1780904597902;
        Mon, 08 Jun 2026 00:43:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcd3sm3580175e87.25.2026.06.08.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:43:15 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:43:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: gdsc: add LEGACY_FOOTSWITCH support for
 MSM8x60
Message-ID: <une6qztpfyfelwxetf5bupbbqs5da2zrkzv6sexiy27yqdafb6@q5bdqtdyl4ag>
References: <20260602050840.435933-1-github.com@herrie.org>
 <20260602050840.435933-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602050840.435933-2-github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MCBTYWx0ZWRfX4guWfqCpCza1
 y0bn6fbGnPqVrHmBKXx4xcTd4J9Frz2itQIwPAtH7Zwkyy+ToYkxApSs8skFwzDojOtAKb61oMg
 LpSi3EKQf7aL8Bvz/o7DZjPAO5pgSVo1FjrCvhjvMK7zkM/ysQvxouCcrqMJwHb8m2eeLtDtmNY
 LLMIRG+C32/wjKyb1mmMfdvoopXGPMEdH9eZmzBxXs3IBU8Qrp35kHxapMyWGFBWlIsL9nYDKD8
 ADGX5VRwKOwYz+cAOCofqg+cQslcfp8TNnE6wnUVxeXtwMz25U7Y89ooABRN3TJ0kmn+df15TYA
 69UFyEiWQ2JaGMS4zBeEDzAWJbFbqUbrUxYvpJzMK6GMRYHCihjH9mhbVgVFLb/xKy5h8aBMg7P
 DPN9LsnTLgv+ltCJVyVPrzGVBc8AfuX/cnsgTyilMd2ALKuIABY2nv5zQHtZDoxZHjS5qZD4JF0
 RP7kN96AgCwApWrEw9Q==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a267297 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e_rwawtQEMkb99PG9scA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: iYONWVvPsnD3pKpe-njYsuR0pFQpqB6d
X-Proofpoint-GUID: iYONWVvPsnD3pKpe-njYsuR0pFQpqB6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080070

On Tue, Jun 02, 2026 at 07:08:37AM +0200, Herman van Hazendonk wrote:
> The MSM8x60 family (MSM8260, MSM8660, APQ8060) ships an older
> footswitch (FS / "GFS") block that pre-dates the GDSC programming
> model the existing driver was designed around. Adding GDSC entries
> for that family's MMCC power domains needs the driver to understand
> the legacy register layout:
> 

I think I've seen already this series. But this one doesn't have a cover
letter.

I'd kindly ask to do the following:
- Try using the b4 tool. It automates a lot of things for you, including
  some of the checks, cover letters, versioning, etc. You should be able
  to import your current series.

- Wait for a few more days, collect review comments and review-by's,
  then start sending the next iteration of the series. Don't rush, send
  them one by one, checking that the cover letters, versions are fine.

- Make sure that all changes are reflected in the bindings. If the
  binding is already in place and you are just sending the missing
  headers, mention it in the commit message.

- Comments are nice, but don't put too much into them. There is no need
  to explain everything again and again.

- Think from the reviewers point of view. Footswitch can go together
  with the mmcc patches. Or in one of the patches you were mentioning
  the apcs which doesn't (yet) exist for MSM8x60.

- Again, don't rush. You did a great job for a very nice hardware (I
  will even dig the APQ8060 out of my closet at some point), now let's
  get those merged.

-- 
With best wishes
Dmitry
