Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2FA3D9DC0
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052708; cv=none; b=DXUoIKam/6b2w29dLkH6RDf2GBN+ELTf1YlJSgMdJVQXJPXgrDolKg4oCA7lCcRRe0jhxa6luCXPU2LiRowvGCdG3DbhT+EfKwogF8QMyOHAU+WkzLyBlQ6IbnFnE9b88Nb19ttDJS+M+yJr5126nZFeLvzhKEPeqmNsbY++U6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052708; c=relaxed/simple;
	bh=NY86+UtTeN18brVKhHbm/eqdMY5zVtKQJb4K6zcHeRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1UPU7kX/dU53tpado3uisqx2w16roi5alj7/kdFFa0vYXvZ934hy0clinb3finNnqMn0IK5NUfjktz6xN7M+3/7hhX2BsPvy7ng52HkXzDvQWZ5Fbd/rahAk4js07Wx2xc1Bdca30EKYwVae8+ubcE82mtsDcJ6w6XzIhMq6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDaYJE67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gT6fn8WP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDaYJE67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gT6fn8WP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABXgi1021690
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mY/6T9BzpgCW5+CBVXCrMzv9
	tYsak1ues+rkztrNeAY=; b=aDaYJE67/YJaLsP5MU26olE2o/gnHt3LF2RU69y8
	1IqTUHUJl/2OsJr1+y73hzZhoKOKhGMMnLG8SwQFX9aAWvHgGSbNdmAQScj5JlZb
	48XUUcylx2IAAp7VjYWw0JAYmH5Gz5OuPnQ1I8mouO+ftuW013CqQKRw98KV9zMn
	17TjJyOIMoo/3GuYLJLAaGLCpJjSK9i8vI7oSDOJoSqLwyf2w4udVE7U14KqsoWm
	wwj5WGgSEShk/Awvgl4JMyob1kPBdonG/4++uRubgGe+Z83pFuK7xJyXJbCVDyQ9
	oTYnOx1ugBcUmLpJ8qLkWD+HDjSdvXWLKSdzulIXwh9Ptg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0uejk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:31:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9368f2b7b2bso456686785a.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 04:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787052705; x=1787657505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mY/6T9BzpgCW5+CBVXCrMzv9tYsak1ues+rkztrNeAY=;
        b=gT6fn8WPiFwPoEee+yKy4B3yMMHDSzpFBURuLGCAGibnN8Z7fstcaVK+FSumiIhSpU
         xUg96daFGf0mJFEY37C6ZFrIMpN+r12R0MyDAa/RgekEWfpIYoplEt6DtxDLWJiG2aPd
         UHs4Q9NaMI7B0686xVmGYBhGqQZnvHQm3PCqdmnyitkfEUVjwRTnnNLZlFSXjUkWT8Ux
         shNffN3iqxyw1fHCLlyb1tJLsdkjBosUJoXc7HM3rSJ3C3y4m8GVNN+0R5N54YmeFxAG
         oqo7gTB8yoK4GW9AGEC0TXfBFCFLuu0emnKFFDL3ZzCAH4CFtyHMuRqOLxAiI4aGzNYo
         eNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787052705; x=1787657505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY/6T9BzpgCW5+CBVXCrMzv9tYsak1ues+rkztrNeAY=;
        b=ZaPwWNh1DjXlyMjJck8uL37TvXlsCIWCwcyh+bOz940ylST6wMGcmmJqtUWe1oiS9l
         GbDI0FQRdq8JNAYOmwvoq0+mf6HbdcL7BYoFu69wuzpSfkHwLuJRdGnwnrrK0fGX76+b
         XCkHYSGGnDb0QfxHP27IK7AqYdNMrDe9M9t6JGxuEWiu0KXiVKFgIeFKk4q9TflSdtq/
         Y95hGO3DCmOcvAKBmmjZR3oucEZkFbVCiMqTYpCiql8J6BfJGIX3SIc6iptnzbFL7v+x
         aO7KRRZQUu9zZ2q4kD16oDM8h0xjXoq0Db5r5EQGvZ5yxJ+EhHXXxwrLVNrDfAe/XhD/
         Fugw==
X-Forwarded-Encrypted: i=1; AHgh+RoZV2USWupv/FZl1kpjEX5trCcTv1TX6YFD+0KIPaLKubeUCKw50MW3KYkIwjRoeojdjOz0d2bA+0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwiAQ87uX8zBkPXYNmEVqW6/nh9GfVoGYau+ykoevyJxut+uNE
	+1BFCaJxbG3tqYFBrKvvw9kLB/YgUL1SO2GGDt8UJeyispMKjdRVLQ0Y77hyFe/ZOgMNMaP9koB
	+dmL3uQT8lTSkKYgMa3HeFL2RulSak5BZzy02Y3p/phW4H8ogy0vEJmuMGg1tdAE=
X-Gm-Gg: AR+sD12LN60BX9eU+ojx1QHFCqDUEybmsHivt4mugqynAMMp/gTSn+hKSwof/r1juQM
	hQPDe2IIpyf7m/iA3xpm3cremwp0VjcKQsDyk57aviX0Zjw02KWpavPy23wkG2ZxAZtpuxIcs/Z
	JMMAJ7jc4JNHWyXnnzXqG6ClENa1ddu+cBsW3ZREcEYKjQ9ISbjmxl1Mo5sJ+2J1XsXLlDA30tb
	EfYq1m2nav5eU2k0MSZAJbkXyD/WjoTRmPjQ1LM5Ejo19frJxUziH4KaQRwXrNzQMb1OnlVkhXO
	iBx+AVKph3Pyc08yGl+1JCMtA9nns6LFUzeYN1tlycTCkI1qS8s6+NlkJNi+dUH4CtBfQvYCl9c
	5cyAEviKukYDio9rHu/3fR6zP/A6DT6pKxlxjDHT+w40tlAxGhr8ETRRjHsGnCc2WBEdroHUgnH
	976gYA4qsNVK+7
X-Received: by 2002:a05:620a:454b:b0:92e:bbd0:260c with SMTP id af79cd13be357-93704baf1a1mr666050985a.36.1787052704994;
        Tue, 18 Aug 2026 04:31:44 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:92e:bbd0:260c with SMTP id af79cd13be357-93704baf1a1mr666044885a.36.1787052704548;
        Tue, 18 Aug 2026 04:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcc39sm10808521fa.29.2026.08.18.04.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:31:43 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:31:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 06/12] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <54w3hlnu5ta5v6coj74o34nt4idolyaabecsse54sebpnyawyc@gbkvunxqdxj5>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-7-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-7-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfXxey+AuuFFgRF
 iwmA9ENZiuRgq1f9ROw+CqcjG1qsuUfM9EkhJHnv4yftWo2blkiMF+6QoB0RO9uE+vL+xQRCUNw
 vt668YEmwbf7je+aT74nsIkHoYV7S+A=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a8442a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ZfTvDAhhgTXKM-HDKzAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: AspXTM2LGlS5dQrFQyaQNuSrlAKb5OVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX3slfrkfqT1Sv
 W0ILgPZwt4T4vgGeQIZEbRD3Ir7RiIrPAsD7635U+45Pyh2ZzMAz0sAkI+ThmF+6WpkZdP4UdSo
 wK5hAMTzXuM/ShyrRY1rNm8YTSroBnoLqK3s5iAxsuEjC8++hJ9jlYISIax60lmne1KH0wU2ZJ6
 tAiJQLym0z0LoyOICym1tcikg63+kQwQzpM1pCQ/enuwtKMEWZGB7v2Zv1s9z6Fhr4WNGup6jir
 GopOntmOH+RRUKyed+zM1BB/KkOt5gREkenSL6Dx2Z5ycDCOpuh7QOU9lBOzGWJGQKz9WUiol9q
 VEll669HerFQ/hyWyn30wqcMY+MRNbYLzuPOTAJm7FgNFYZPE4PNWV4ZD8pKw3N/q56gisB9o8e
 ISpEOZowIqkwslivIZ9GtbIy6TwL7q4M9Xk8xwSRZMqdrxMxqLPCJzt6hrYAMOnuF7ITSGGxSbA
 ui62oBXMt2PJdkWlM3Q==
X-Proofpoint-ORIG-GUID: AspXTM2LGlS5dQrFQyaQNuSrlAKb5OVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180085

On Tue, Aug 18, 2026 at 08:07:48AM +0000, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
