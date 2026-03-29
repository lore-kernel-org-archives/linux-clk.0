Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8E30C354
	for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 10:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781605; cv=none; b=qv2A9BrOYoG1qBvmnCRblxyrAkQD93G6A95hgXNv51NYpbq/qqVTsXTfGtwQ3LVmJxo/Ax8RPfwDNlNPUOkvUbevx4TujU6iOf52jiVhFIkA5b+8gGjMHcTm/PiUo4lDKQuOJUWv1WT/ntmnrFSCfU9K6TSLLz004AEohyjWnL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781605; c=relaxed/simple;
	bh=BdDWlm9BRqHY8tjK8/4aj7Hg0e/7Tpv2q2ieM1+zSVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UY3+Jf4gImvx8KXcR/vvhU/mM336rNWMFX7TvcjdNrRIqeLtZ+UO3qrTJR7QkBYuWbKOsZYlwQ95HKQcG38ohgMwiix9JZsxtd/uSsqKamTMMTl1L2W0XsiwWPaSrnrrPNiItLsFoqf3Les8P4x9M8Ao6o3EJ0Djd5a5Vp2zzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nX5zkHrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBfZRk7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nX5zkHrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBfZRk7o"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAiAUq3932272
	for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 10:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/rTaVNY1wzo8rZih8YshA5dD
	ugomeeDFDEcqLjW4chI=; b=nX5zkHrQC4Yrea8CBQJr4ttsarHDQ1xlUozdAStv
	eqGBaURSCPYj3mtd/7tLcHEM5avU8GTZjO6Gvj+PeRL15CGgJLq4ArO26sAcWXmh
	8I7lF9sCIKBXwRAp/NAymhec+gbb3ATw8XLlIMLB+y4yLENMh6HHUOmSnKqK1kzx
	a1nOowmqi9Kqebzo8l9miqdw1HsyVZzcS61gJ1nEvfvccHxfWNV3d9NvvOuCoASX
	gcZUu4fIDpccva4tDSJtBGbuEfdM05PLgPEUJd0SW2D92xRCxsWQiUWUA0vIKL7L
	Oo9p+kT1XK3MDlvVdnwxSozXNKYtTlaBDXe/jlux2RS6ZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdax11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 10:53:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2cbe7223so118080271cf.2
        for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 03:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774781602; x=1775386402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/rTaVNY1wzo8rZih8YshA5dDugomeeDFDEcqLjW4chI=;
        b=PBfZRk7onzoBgcZLRHX3+aF9LeQpYxMxaLJcz7/3qOYYhZu5Uvd+TyDtR0j7phrzcN
         lt8lhf03FoMcI2Sj/4JmoMGslsH5OBQH/2rOsJyRSTa3Qu8FTwdf8ryAI3vuz9ptcShN
         gu/36mo5wPxmsWgh43mIrzOpSdhsYkZb6uI1LuIOLtadHsclB+OcWipx2aTxeBvxuPDF
         AMXy7tDvhmjkSUNEdgzDTVnxs1YNWrcJEfxqi4U6tJt6t/Dp7nNJotIGREczBNHVyYVx
         YcfHkyAnphPJeDzhXpL5YD9IYRUSmAtlaPuHkfjGw9xSEOWhX/dworA8/KbNawCZumMe
         HHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781602; x=1775386402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rTaVNY1wzo8rZih8YshA5dDugomeeDFDEcqLjW4chI=;
        b=Ad3SB/ZlPg1G0volEuoN8kZ/y16Qj0yD1TZxiE+an2668P0ZW4yNMWamAnS2bwIdEG
         +sm5hcDclDgDph7gJ0L45fGSyu2T3Hms5zeI2YN/9gePdI1e6FkdqwmecBVHd5wEPiM1
         hAN09fT9iHlL8FrxYsWBICx5mtRO8vAZhoStEaatzwYovWaAevHnjBf0x+aXPpyevTGY
         HL121o0feDU1qRPXH2db6q5GKO7Cnj1JMH3ehBHJQ/kiIzErQCWIyLW02V9DARIfcTYZ
         dVKctTe7wvheVMY5YDNZ48AHb5BnU0LP/bHI0fzMFd/yW0UCezEebw9Nnat23oKpP5QK
         6LKA==
X-Forwarded-Encrypted: i=1; AJvYcCXdtZ9dgrP4+Teo1W0JQW6FZwe5TlJQhnxnsJ3HEq4WsNaVVtEN5V0jzpHcUtqk59ShAMSHmDaUP/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YweRGYldXoeOOPWuCgI2SzWzCy7ufVLfjIifn3H/if+dFB+zHRg
	CciPpAJQYCyTNLrfraQvQW+3mnmmIaB1eykGtZz0jjdrgWX4C49SmCVe2Wlpvnjc0LJNierXoVE
	3DAWIW+efJLxhbfbLoXoJtwXK3L3sN5RbMvvax1W1RH1fn3wv40/GNo3j4aSqjJMPbdFC7dI=
X-Gm-Gg: ATEYQzzfkS7FHUR/lXNiDXgoRrRhvQT3gA84h+OIGpquKTy8+Srrqhv6tsdaETawUCk
	g4AX8EABmTqHX+xTEy1X3HUWZJ/xkrItxKn4U5OlB2iy6Pb8DVlhouAMYvVkQFZ+BIdMYGgUNw+
	i6xL91OOb24ktZksHiQscBZL6eEhfF7d22SNTU7vhGJgByvLuM2AviaROBr3zmUoTs1AnKtdkmP
	rP/d8uj4KYiZ1eyE/NeAk5vi/0qS6peamgLcwGn1/rKUzLQ3Y877ucW7gBTPuNCZAUsXwoXoK2e
	SWjJ8gnZ1qvGvKONi5mwGTD82kp0UoR4RJSfkiia1z9OVIFh87fDa0A5ZvglEvw6F6S7j9STAVp
	ybAVajg2nB18pt0UJNENGUGdy1QXJ9n1Kwpx2kSa76yjcpcZAnbVyqvIo/iFL+i/cBVhi6G5COa
	P9icDDC+cyfWA3NH4Yp80eK/yiDeWfiDSGjsI=
X-Received: by 2002:a05:622a:24f:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50ba3832ecemr122080961cf.29.1774781602547;
        Sun, 29 Mar 2026 03:53:22 -0700 (PDT)
X-Received: by 2002:a05:622a:24f:b0:50b:496c:baa8 with SMTP id d75a77b69052e-50ba3832ecemr122080811cf.29.1774781602164;
        Sun, 29 Mar 2026 03:53:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4350sm968261e87.11.2026.03.29.03.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:53:21 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:53:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gdsc: Fix error path on registration of
 multiple pm subdomains
Message-ID: <4m3n5jrnkpfvaehyx2yjzonbyl4o7ejn24bwufyilenbbt5x7r@cixwn4gihkt3>
References: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328012619.832770-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-ORIG-GUID: zXPpcTP-ZDrqI6fQlcS_K_cSW3_6OCU1
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69c904a3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=7RLGmS9YjY5vpI0NjaMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zXPpcTP-ZDrqI6fQlcS_K_cSW3_6OCU1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MiBTYWx0ZWRfXwzzgXojHPIZy
 ib/w+qGTU3guKbxWZR088u+rOYo85HcJnnWIk1WvIYJbKI3LauBTBIFdsM8Tj1EPkezShap1o1b
 g5OhQdGd0DgYLrAEkrau5irSSZ8zqRoDMAztE1mNZSVDSpoqmv1eaKZEq5gDh8NjqXCy9LQISXp
 /QkYHkCbZJswXdWFz2w4UAc7MZr2VKv65HVG8E+2XpZe5FZErUmVa8JR2pC9NHsgjTKGCziNCfy
 4Q+A7bq2/pHOPwyYR78y+XEAy9YsZiirWbcUHqF8OGRw8VbV5MFOmgC4zI0/EgnrZ4oDHpu4KyM
 aJe9KGhUOER1LbPT8kHyjG8KF/SupC4eLoCp7Us9DmOIMWYYoXoKh+Ze3jSL5CluaavS7KoPUUT
 Xwn+io4zk7VNCq5SKVir34JUkkjFrjaggCpzvkJ2h0SaBC8658rbfIU71glYL/UI1fXmes1sYkB
 8q1MLsQgRzXLJ/9o/MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290082

On Sat, Mar 28, 2026 at 03:26:19AM +0200, Vladimir Zapolskiy wrote:
> Some pm subdomains may be left in added to a parent domain state, if
> gdsc_add_subdomain_list() function fails in the middle and bails from
> a GDSC power domain controller registration out.
> 
> Fixes: b489235b4dc0 ("clk: qcom: Support attaching GDSCs to multiple parents")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
