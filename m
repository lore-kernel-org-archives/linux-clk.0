Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF2942E409
	for <linux-clk@vger.kernel.org>; Thu,  8 Oct 2026 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497131; cv=none; b=oClmxoYfhvOpkTgDX6VkUeDT/zSALGpBERAnerusKKLybyh9Y96PXgjnyAI6mOzxpIRcyIcIOrDyST2SF0Iturv6EPbBPrjLRbpbTWPaIWPCTMQcqeigC6ImnAB05ATrHObgZ2OpRcUwGHIACvr831xBNmK+nn0lNTfFmTGpaeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497131; c=relaxed/simple;
	bh=k5kD2nd+PYguRx7d9ujuhrEXWk+ffbxPUJaokYyDUwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGeAHQygtrggJzxAnId26pVJWaJifNVnfw4DpxGBkEzpgVgyAQ/J3rOG7WCvJSXRofMaRP70/JmPdUAd6wfJR/MX3qP6oJxwCKyq4YIrKtJVhfh3w+SgyDLeBOurUJ/d0DXjOAjsbDz2LpwlpfyoqrOJpB1RuZ6bDMrSdIxO2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCTo1u7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+UV7wGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCTo1u7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+UV7wGC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L03Lq3969348
	for <linux-clk@vger.kernel.org>; Thu, 8 Oct 2026 22:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8spVoufNRd3rhz5qESpKFXoN
	lzuoHybzemabbo/sQ/E=; b=jCTo1u7UkBR37iS6fekZDhxUAlIgikoG4nioGC/f
	ld6zICWXRVcJWqjqYL6z902op2tF9PgAW2Ar4EkvticAugaHpreB4YEt2x8RBLzp
	4Qi3ccIsjYkQxVP0HLsykkoRjZnhAUY+Fr2m1vaY/8SFMdUPm7XbjEm9jcxjLbUs
	QrYNs/a27HgG64nW8Oc9xnL2IUz0nYE11Yb1YagFSQrmuj2X0FgNMik40TTfHwWa
	NBE/Rq4PbNPUwZ1is/hqnOCeXVNlgMTJhJWz83jvXFLJEtBQXAjDaFrmYh5+LFG6
	6coEChN8SuRT8WAozFnE59SHaWT2I4FkeQJTCcfFBF7y2A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk8s6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 22:05:28 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso2209240e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 15:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791497128; x=1792101928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8spVoufNRd3rhz5qESpKFXoNlzuoHybzemabbo/sQ/E=;
        b=f+UV7wGCqXRL4LMxXol6CLKRSJOqHX7zGGOewCCsYl2HitYfMzsRMrFH+ODIXlbENo
         XWCFFY8/As1+f7nCd73ferdVt4j22ioWN1OiRaxqdY0gsgD6xDTtioaURLYavUvQPNnZ
         P8FSvD7xOSkL63tzsPRTWvNPkgDO8Bc88/WeaUkemG1LCfs37rOSjXJ7Ul8BS+oesqjk
         isE5TEXewHZ6371KC7onlA1clJxssPdBilAs/vHZtmiUdjGOzmIdDxr6Pu5bJY3GPehX
         arv690UpxABSvq+IM+ZljZZ60qwrGzPDgHcb42zru+ncUhMYah/9SJ6w3c7IQAFskvq7
         P1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791497128; x=1792101928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8spVoufNRd3rhz5qESpKFXoNlzuoHybzemabbo/sQ/E=;
        b=MBSGRR9nJiEmuuaivXDMbvCUN5BjOYUVD2PMGJ9ZoQrrwMCHcJcJqiNoNlK5hEJ2/2
         +y2Vslkw6pCWz6lOlHWMYaZ+1N8MvRDUXFyEy+SEtZ/ZIlhkYnBy0lNhzBdP++Mk7DwV
         rWlx1rsUyvOp/8qJpv3UnmbAC1/rKYUV+pG3j3lI8zUKtFSH2KVvM/gJQVeqEt9/V5AY
         DllgcjsZatS+CvhBSe+hq4ReaEfiYDaNjS2kxLgGYSBkhoXMsPaczK5YCC2Qr2gkZQIz
         lHzvPGC5Ky7iONVUKqt8H2i9kJ/vxFLKGKOsHtbdGxbEiObzVwmoktWUVUKgDxMfhu7e
         H6IQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5Z6mzwzS0or9cT/ZfqbxjVY56IHbgNbWiNva2hcRz4wc05Dv43h2cSszdbpWCdcKHAwKp8S3hcyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI5WyD6EYMXXKtPo7+8kNxyxjMEpHak9ZkGecCvz8TsijGc2xc
	vgFRhIfWZE9JAPQlOqEyZ8ZyHbqmmbtfnP1x9LjLjJs/27gHNTJaiXSRNSpnkBa1kDpuxpHk7f3
	Cm2qXnZ0bYdchgj+wttWk9r9wEv/wGwBvHZRro9/OZuQt8edew1WARt25m8zNgrN8+/0RQjCMAQ
	==
X-Gm-Gg: AYBFou3xBDYsCV6MGVmBxquJA0QyZsj8wob/e/1BNvXZQbD6migGcnTe6F2vAhcaN+D
	9lYpbV+e/eWFc7M/IeoxMHXX5UzaWA3EJ4RRGI/W1lTLv6eOl2GcINmUY/ym2/InqsFMN4W/Srs
	h+yG3+6cWTEFnqObOG0simCB5+hFS+lqHm9iaH5P6sZts2W6X/dZD1r2U9BLJIJNezyEYymNOVl
	1/YiPt0VO/GiBgQ9QJCA+ug2EXabIKH0kwOPGFACLwS7AAqHZA9G/uIRE8vC3iaSVsqRzk75J0a
	2JCI+8xZw1w45Wtpig/OpSpoh/CCgyfbptGHnPloornBIENImLrW4q63nONXSv2AqCaqM8a8t8U
	GVqjhbVW5sNOEgT2uu5/dT6OYz2LK5XVotIaJKBK2CdU4A9NKGTzmOPDqT5cOkFG4EwpSwX4nkM
	CX6WAQ6SJ9Xf3x
X-Received: by 2002:a05:6102:c07:b0:7c3:43cd:6fa6 with SMTP id ada2fe7eead31-7cb372e11b5mr69710137.18.1791497127598;
        Thu, 08 Oct 2026 15:05:27 -0700 (PDT)
X-Received: by 2002:a05:6102:c07:b0:7c3:43cd:6fa6 with SMTP id ada2fe7eead31-7cb372e11b5mr69698137.18.1791497126996;
        Thu, 08 Oct 2026 15:05:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caa6edsm1062341fa.16.2026.10.08.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:05:24 -0700 (PDT)
Date: Fri, 9 Oct 2026 01:05:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Do not keep the video core clock
 always on
Message-ID: <lc6rpnhdxy6kdc35k2l4ffr5j77thjrpwlvig72msrl6rzbho4@do46m7g6lt27>
References: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
X-Proofpoint-GUID: SB53zl-6FTEzFoPMBeDAF-Sk4gu1alms
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4OCBTYWx0ZWRfX0c15AfZKcdTq
 ZYw0fAdvQAnnfisUC2XU3mXtd67o3IM/n2qoeFAXHbjaWbVVJqKF+BrTbdNX257T9I0rNgo8reI
 jL9G+AWAiWiUN+Ij43hXlBiaK9zNBQc=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac813a8 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=f4K2bgMlGXeKnjgVb0cA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4OCBTYWx0ZWRfXz+fET9IEHG1W
 aeoqxywbU7xOy3YRPZYrd09YKovNJrmd5Hh973OLBnM8s2O1FubHzOxOIUHl9RPk91We03tIJRQ
 ipIyETudQDQOQDel0ppFZvuDJPX7mLoGIPZYPdeyTGD0xJBw+tuXjt4WH4lUTCDNoZg5Rj6wAjD
 +H71vAjDYVgCjTo8Ngu3GmSo2SySM7N1QiFTyXaw7KvccFLadXQk7xelgVU75yVI4Ivk/9OoJCA
 G+YMlKs+Vi+6rh6QuvI3ETaaY5Lmj/XbIMaPU2MjZjWE9cH7ZugYxSYRYIxTOr1wqKGZdJMNqIl
 +EFm0HtUmIVhjIs+XQcSESe+WlUY08ZjMlMPTTcqktlGzrPv3P4kJ0jTUBTBzAXCqTntFZ+mmsC
 K2deccIPI+IhsabuROkpzZeydEOF+ACtNgfHfBGFuGZzUYHffLpY9uslH33eiQ5QfHjCPT/IZUA
 AZPnHBcZ/NOwocIStCA==
X-Proofpoint-ORIG-GUID: SB53zl-6FTEzFoPMBeDAF-Sk4gu1alms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080088

On Thu, Oct 08, 2026 at 06:49:18PM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> video_core_clk_src is marked CLK_IS_CRITICAL, so it is kept prepared and
> enabled from boot, and with it its parent XO, which the RPM then can
> never shut down. Nothing records why: the clock only feeds the video
> codec, whose driver enables the core clock it needs, and the same clock
> is not critical on MSM8996 or MSM8998.
> 
> Drop the flag.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on a Motorola Moto X4 (SDM630): with the other votes that hold
> XO removed, the SoC shut XO down in every suspend with this change and
> in none without it. With the video codec enabled for the test, it
> probed and loaded its firmware, and the clock was off while the codec
> was idle.
> ---
>  drivers/clk/qcom/mmcc-sdm660.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
