Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD0B352024
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 06:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901193; cv=none; b=i3JoEQiFwLJsu2Gkogfo/lnn/4qDuNboOzUg8HouDAEKxlWqZl+lxJERewO+C2VckoXqcX5f+zCiWAuqgObD1hRyo7sSkE+z5SVyBFrvUFUB5jI24hKVjxv4yaQsbpT5xXWgep5X3BQfv0/uMLhLd58GBmz0RufiBVGS3heVoUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901193; c=relaxed/simple;
	bh=JN87ctyHPeOxXKmUEmgCodS7Ir+BuB+OwLjPhguGXxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haw+MI520Gf0/g1kRR71pY9srNdDAttSvRbGWu5JTydJe7lPGtbKhc1eFd5dG1wbcx1QGBN+p5dFoGYlG8ETm7ytSgLoE4ABPpTPsdQLVIgSvGMVCuWjEPiyDTTMUG7S5j7UaVZxzWadL5jfVsJjNgijWOBrtkaFKMmzBOlKiXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVkSX4aF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgjZwZbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVkSX4aF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgjZwZbW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OkBS2382814
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 06:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lFJEmac4GRe+nzIxeHA4CpDV
	BFHZhRqSLc23NBTsn04=; b=VVkSX4aFZODzZTy55/C4qMc39iB1naF2/bYfqSud
	XGNw7DFGKtCjORSW9HJRZpOj5xSi8CP9xOQRASa5+gtNoYQ4jNsFT/tb3b6fURRp
	0ZZWIDvs0aLu1mnUDTo2JCwgG0574drTxCw4vzaoSsO1u6ULs0FLrMtKdx7AGWMh
	w/mfFTeohJL1Kumqu5YzFX1Yg1MEYpidJjZE4ldZnx5b3OUkL+oqtk1n/8LqSj+h
	sSe7/V24UymZ5OSTv/3sxmXVdNR5vsTc+amWg77ZAZ9qTLnHGWLGHTum5VyEAO2z
	lYorEMkeFdshyuVluamhPWx7IFOSs2DU2+SqQ1EMCu+atQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cxuqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 06:46:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfb3463931so5144975137.0
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 23:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901190; x=1781505990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lFJEmac4GRe+nzIxeHA4CpDVBFHZhRqSLc23NBTsn04=;
        b=HgjZwZbWHG/8TIpnCUkbbRlXtIJFipmD3q5UcOV/TKptm72e0eMHaqzSxpLGeY7+8k
         kVB7aSzkh7uhs4Tr6ULWfOUAluB86IkGO/z9M/WaXYYPUUvhoxZxDSVpEVS4vX/NZdl+
         mn7S8YDU/Y1Inxo73ZuzcH7o0IIDDXeC5IUPB+goj7BkDnajqLCvr24fHfsBrsRBv+VC
         TldOg8XNpIGhCHwb6cTErv2iNiWmolZowmefFRS/wfyuutAslmgt6oGDmqX4PV+lVvrw
         dohJbRbKa2GpRgqW+1Tq1g82ksEJOPnjfaoEAYfJfDfhDk+LDQpzxRYbKTVoXnWF8Zui
         bxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901190; x=1781505990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFJEmac4GRe+nzIxeHA4CpDVBFHZhRqSLc23NBTsn04=;
        b=Xh/FeiD96hVCUycOTEH35y9zI85zvIcCK/v4UuprKmQADaDVtqgN+9EfbI740dLtoz
         YXFbuM52VW8eeFxTqDI0Y7eIxtUf1l3+qGD5MLI8D6jzmy9qFPdxcb7PVCO3wexX1QOv
         COt5lY23y3+ljBfZ0yC/qiM9lr6YXBv4PHDfqvH8Gq6oi3gjEt1+MoRbItgFofKQraTc
         pR0eUtw534Rpq0AWMzpX2sxn6jhWZJeVqAluXSEGrDgud+TEjVR/GsJ/YCEL5rw1ckof
         v5UBxJBJfpb+eg1jela+EZUv+zruxoSjZSPlBF2lMj6mrD5RDBNMjOdIo1DQ+yRsqKqh
         unsQ==
X-Forwarded-Encrypted: i=1; AFNElJ89EqHaSaJKGQRbssbLdVyYcF4WEB638kfvGx+LK0OOfYcN8ze9JxkN4eCBiMm3ukS+rEgYp8fY9cU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj7htyrsGoIbpMZIQBH0/fsNddtT1z2yesHXXW3CN5eMUs5UbH
	5SJogOjkAwpm1O1P5QskNnSuYHdr1rEzSFEQ7zsOJn/69YJIKo3CXQPXrJOkUmzoyT8Khmt0oGM
	IiFzL33pHXlGXjwl5MJH7bzmOnV2nXNetREVXsWX60DIkFPvYPkEWaMnFSwptM8w=
X-Gm-Gg: Acq92OFqc8+Q26YaTRjlgcY/9dUpo3qEXlWg/TIgHbBHT7LIbb+0tOthYT/bqLSNuGh
	t9ZegAeoTVpngsXPzRd0us2AgxCDFSjYUQ1ogNDrAvxs9kl5Pfvv1S6AiAjyVgHjd9WcQ84BPAw
	1mV4qC1aFKsLuOu9vJB7awt/m6epJLgyBy2MDiQxs8FJWIPuoFogm7wzgqWbyDNDKsmNsbk0ojy
	1ihSo3YZ8w6U8R2Bm1zihfg0ZWyNQnM1iCdxKEqOGmR1JvOA6E+zcLBZUq4xulIZL5Ep0Ko+tdR
	OV3ftkEkxzdVgg8/to1Z+TblEIx1+o0sb8V84FGf1d9PQ8EuQsOcK5URKDNieCX5PNnLbVv/5QD
	Pr5RsGoztfwFZybfRqCaPdBdkhhWVpkpdBPhh/amwoqmEZQiWqydgiSNQdc8nzOMeSkkOS4rQmM
	DQNzo0AkKRDEyZUk+6+7bLtvtwJbsOT647pafD1kXzEPY4dQ==
X-Received: by 2002:a05:6102:5cc2:b0:6d8:f538:f01e with SMTP id ada2fe7eead31-6ff09f9542cmr7603042137.24.1780901190579;
        Sun, 07 Jun 2026 23:46:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc2:b0:6d8:f538:f01e with SMTP id ada2fe7eead31-6ff09f9542cmr7603032137.24.1780901190155;
        Sun, 07 Jun 2026 23:46:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9929cfsm3596342e87.75.2026.06.07.23.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:46:29 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:46:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: gdsc: tear down per-domain genpds in
 gdsc_unregister()
Message-ID: <ejwrpaafbc3fbfjlhsho4lrv24wjwxo5nat6pqns6cuhgzs2a4@qojap5ykmdvd>
References: <20260602140934.796697-1-github.com@herrie.org>
 <20260602140934.796697-4-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602140934.796697-4-github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MCBTYWx0ZWRfX3vpqRdIzHjKZ
 NfIVNet4XDyE0DG8XJfO/Pk5409WgKT48mSj6nvanic8hJbdJBQZDi57FbjvTgrclhuj4fplPxp
 z7tO9nmSlJog7Cgg885bKQSopqe9+a6Pp6lZG22m2svekXEvwu2v9bpgx8Q4Sa+pAyQWjYxNFm7
 aIGNmnBucpSfmyN45Vyb56mxTABJqr52NcF1rVMSKR11OZpaHEZDMl1WjvuodBHeMLC7FoT2Lfo
 Vtrd8BNNmEcSv1BwBLNs0XWA1X5Ozp5DhhbxK6rRoXBJQwiRNGw1mXQ47wKideHKAIhT4bKOGcL
 3Mh3VNAf5WNKpg6ZF5K9enksjYBwwq8N/+g8fh/Hmy/xKfsTdzJeSgezolkf0hO5GbXyRkP29xL
 hV7+1aenAe/B3tAE4Y1YryzEdlWIWXyJTgE4+r3vXPzK6jERJ359AfVh5+aXnuUaYkcsauMpAxg
 oa1QjrpF1JfnYyPT7Mg==
X-Proofpoint-ORIG-GUID: sAw1tvvByQU8lGUo1twdUiRNMALWQxKw
X-Proofpoint-GUID: sAw1tvvByQU8lGUo1twdUiRNMALWQxKw
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a266547 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=cTwmTnRGAAAA:8
 a=EUspDBNiAAAA:8 a=wpqClQe9m7PrORRek7AA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080060

On Tue, Jun 02, 2026 at 04:09:34PM +0200, Herman van Hazendonk wrote:
> gdsc_unregister() removes the OF provider entry and tears down the
> parent/subdomain wiring, but never calls pm_genpd_remove() on the
> individual generic_pm_domain structures registered by gdsc_init():
> 
> 	void gdsc_unregister(struct gdsc_desc *desc)
> 	{
> 		struct device *dev = desc->dev;
> 		size_t num = desc->num;
> 
> 		gdsc_pm_subdomain_remove(desc, num);
> 		of_genpd_del_provider(dev->of_node);
> 	}
> 
> That leaves dangling entries on the global gpd_list. After a provider
> unbind/rebind cycle (deferred-probe replay during early boot, real
> module unload of a clk driver that owns GDSCs, or an OF-overlay tear-
> down) the next gdsc_init() will end up trying to re-register a name
> that is still in the list and pm_genpd_init() returns -EEXIST.
> 
> While we are here, flip the order so the consumer-facing OF provider
> entry is the first thing removed -- otherwise a fresh
> of_genpd_get_from_provider() call racing with the teardown could
> attach to a domain that is mid-removal.
> 
> Iterate the scs[] array and pm_genpd_remove() each registered domain
> after the subdomain links are torn down. The regulators stay devm-
> managed (devm_regulator_get_optional() in gdsc_register()), so the
> release happens automatically when the underlying device is unbound;
> just the genpd accounting needs to be undone explicitly.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/gdsc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Fixes: 45dd0e55317c ("clk: qcom: Add support for GDSCs")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
