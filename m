Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C572DB7BE
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726626; cv=none; b=SEIwFHPj4SFImbu5WNLSU4LDGzUytshFRbzKjvkh79AhYVYwhaZO7kx+nCusR1zs+w8YOrBaBXO2YwaDGMxOeZYcbpm/HiUF9FOsg4XY9VpttN6EjqI1P05M0DwHFoGG9HRr2Ly0liY/ZBDnaQF7aagg7D/Gz3RnSaEaIWG/7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726626; c=relaxed/simple;
	bh=GAUXAH/+jcrj/0omWp8UhQTaBRuNlXrbRCuliCA7Q/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJHCLJXF7EOuu4XZHUMqDwvuALCKeX/Rwo+sg+Vs9v711U9KdikrgRDeaJtRzBxTnPhky1PJKoxRDBFeYzdfLpgKK6UdsI+pJbI1WBlCpd8f2m9i9K5FIERm6vj16rOwaLDLk0OZBKEnH4qxgsRghNg0VBV7vA7anLplZHnhCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxSElfCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVezbDnD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxSElfCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVezbDnD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1XkI1082342
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T97adHJ2YBIYEe292GMps06e
	0kZve/Z4wOJe9Q5DRF8=; b=kxSElfCvDxt+u4M5ExpORvNUFXzGN1801hNGRxR4
	UGz4aOQoTnvmE6dkeQHy/+eFxz2bJCzOKOPPUnv1cKDxHwMHnCHjXWr730zYNqqa
	+JSX5VGI5/rCqYKU7Q31Xt5oP42jBsaRKAhMJwtvsZTKx9G2xjMD2xsqFCz1VN/i
	6Pta8xF6hwi7F8xBgnaRd4QT6lNb4ttuEu6nnN6pAEYtT2jyOfhtXazoJQfdAcgq
	lCnp6wlm3behDpEGS+Ko/CFC77Ag3H9SuNJLhtF92mYYDGqbC9kScimQ6I/SkJ60
	4UXZuCrooLGX8sWpJZoafIINnXHV8tUHDnz9CmPjuSP3rA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt1kx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 13:23:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so115117131cf.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726622; x=1785331422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T97adHJ2YBIYEe292GMps06e0kZve/Z4wOJe9Q5DRF8=;
        b=PVezbDnDNgGwdKiLSdUF2IDsfVpl0hH//OeDWrg98JYIZ/GoSuQCfPivdA07chgeFk
         FlBlOYbAbt14Pz019M+u4vShVFpRLg8mtOBgn+5aIAPBNT31Vtt/qmdrR81Cvs0MbKnQ
         akCbg449TLgXMQGdAyVO8zjLskWfCCKKPWeF23+7twjqyJjBkkr/EmnXg0bD5EpmHXxW
         D2RUgDI1XyaU8ipY6kHXJvhxpkzwjqtp3pmf6BDd0L6PR0pRe2BZTa8mXZun5lAOQpeY
         T6e7kd3Qpjzwc3gpS8Mhd5rvUM9QWnfeOwdG8/zdW6DePIqHIk+5MF7319AQ/bOyKrau
         Ouiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726622; x=1785331422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T97adHJ2YBIYEe292GMps06e0kZve/Z4wOJe9Q5DRF8=;
        b=VmkyBBNEiRyH0JmjGRNzrS0/qTQwSIu2d1F59sadd0L9vutlX3CFVtIkUGlQoL0s4a
         yu/6bc5sjXBxyjD7dm03RH09AwUAike08azeC/clDHuuqqxAQ5sfodNCmyVC2KpjGJV0
         KI4QFDXKO2RtrJ1vlEl4xXDu45Vye3B6GEPNreNoRbIdLD12flLzsCXO0asPTO+L/uC3
         VrzY+6EiyU7D0mbkBqSd0e0sAH8C+YNNB0pdJQis+QKY6+CA/qBf10TmXE7zZKAkT1qh
         O48LrstdLzUxkP9a8jYXQWOYkahfz9DNsM+h+clHO0T8WpSqpkz7Rj0p38497Ob6DIfY
         OAwg==
X-Forwarded-Encrypted: i=1; AHgh+RrhX7DVuv83aFxV9KFbk052Z88bvJQ5Lhvmx6SH2Etbf6VVhwqpfRf2c09YMJo7EmtouFMAFt02e/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDxhdEaPLFR3zJG4n/gin3pYrd6iTfFXQJGFkwKZ4j9G4QBwTQ
	g4lUrZNMGzmGpzRSRH0HEyevHP7kUJZY4XOwOLvUD4pUCQ7zL7k+kbGAkJ5QQvCQfy7OAqa6pDu
	AWbMkt1/frxzd9bqWYpKobWJoHlskewbMXrX3HNbwaRyRkVC4ejtP8qlwlRRa98Y=
X-Gm-Gg: AR+sD12GyyQVKViKN22M5/CkzDPto+6L9p3+/FX7qrFIbJ0YUQO/9HFRiKuMKEUuiux
	WTb0ohOzRAwQAxZDBO4hAMp+EsBH8+nsqcWwQKX58TBz4BP+9xQrQLlXdP4BJY2a/WsUp1uup8l
	kjUNw4yP6/ooxBnad6Lmc5VXVltLroY1y4QoAI2HpXZE3Tkl+8aO6nTCv1ORNNfNtBCG2Ca5rBm
	g8Ia+PJnTemLwIhOWWgmvBbY0hmeEXEY/hPC5BjW+3itzKljXllSuxCwG0Fz64kdYiq+7eD9ztB
	8BTOuTHJmFxJoKhG8yL2r3djleGCK6hMWL7F4WvpiMi17fMoikExuHO1PPfHJCnUMNjCCgAHvq4
	Y8sKpkTLP8ROuiJMeyYRbnMTkzzWgIabywa9pN7lAgDnWUPWQcYtf6fl2NXh3AxlNQc5F+6SxDG
	Ka6kyfYkw/rd/G/Q==
X-Received: by 2002:ac8:7f53:0:b0:51c:849e:e222 with SMTP id d75a77b69052e-5213cdcc8f7mr224047661cf.36.1784726621553;
        Wed, 22 Jul 2026 06:23:41 -0700 (PDT)
X-Received: by 2002:ac8:7f53:0:b0:51c:849e:e222 with SMTP id d75a77b69052e-5213cdcc8f7mr224047101cf.36.1784726620901;
        Wed, 22 Jul 2026 06:23:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e4313fsm465846e87.60.2026.07.22.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:23:39 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:23:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
Message-ID: <2fsd7y2myhb4tx4t3owjiqyavvhly5qewpfqlaujewnlvrwejm@wqodgnuahspo>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-1-56fd05822270@proton.me>
 <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e43fd30b-4f97-4f14-85f2-7d113c0dc1c3@ixit.cz>
X-Proofpoint-ORIG-GUID: yksqCBncdnXYNnPmJMQwAHSfKKjLv7ty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX9et1Fc2gituB
 nfkTodTunRxxRVTLsPMLgAHFdl8h7dCvAKX0IbL23KVZZksoOjGd/Qi5wsRius6lb6BM19L5hyD
 oJMEDAfG/n6Vfx1j7RBgFlKEpSNJImD/MWSIW4FaPafis4hWozgYs4tiIuT9/oBh838jNvL2oEg
 uCFZK+CL+w45s1C+7Ck6RYQX44/URf7wAAvUcFna6B9i/AyRukF6kpIeMSXFLMsCQ1e8xLYyvIh
 lC+QmyXJKBIN5XIlX4NET/YKBz73IawQwwkt8DKhuK8cqwgoncq8CYInG3t2eHXXvGfODJ/4FWp
 J30UqP+FUhJ22vlyA3B16KNZgx8cl2TXOIf0d1ppBKRxUuzOLEvFVEJk+bEEU98xbPUvd2Dc9xP
 e27HWEh2AzzWK3dVr8T8OB3BW1d+OQyDsAhba/IZTQ2z/3fkebXv6B6P0aBgdXXHKcPaXKfFTFB
 FI8kW631RmoUDmgG8sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX1yedgaiARvdG
 tJh636/TaEoxjeQmbNgtPlqJfZ7lpGBQyA9LkAhGVgZNK/lq0+siSNOjM7UI/DJgq6+/sCEJHNc
 LDVc3Qbv0gZeIHo9aCvpn5mNvoiXhIo=
X-Proofpoint-GUID: yksqCBncdnXYNnPmJMQwAHSfKKjLv7ty
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60c45e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=PTqE-MslAAAA:20
 a=EUspDBNiAAAA:8 a=3Q0qqnQoSDvQtWHvQ2EA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Fri, Jul 17, 2026 at 11:02:11PM +0200, David Heidelberg wrote:
> On 14/07/2026 05:28, Esteban Urrutia via B4 Relay wrote:
> > From: Esteban Urrutia <esteuwu@proton.me>
> > 
> > If the clock frequency is changed at registration time, a flicker will be
> > visible at boot.
> > Switching to clk_rcg2_shared_no_init_park_ops fixes this.
> > 
> > Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> > ---
> >   drivers/clk/qcom/dispcc-sm8450.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> Heya,
> 
> it's likely this change will be safe for older sdm845 too? Comma.AI people
> have it applied downstream on top of 6.18/7.1 [1], so I'm wondering if it's
> something after testing on available targets could be enabled for 845 too.

Yes. Please send it (for sdm845 and at least other dispcc controllers).

> 
> David
> 
> [1] https://github.com/commaai/vamOS/blob/master/kernel/patches/0004-clk-qcom-dispcc-sdm845-use-no_init_park-ops-for-disp.patch
> [...]

-- 
With best wishes
Dmitry
