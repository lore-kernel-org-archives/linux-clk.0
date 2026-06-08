Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C1733F8B4
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900990; cv=none; b=gZ4JsZv+SmhOFzZQqrDQf0RdAhbPytqhmDFnDIbpbjzB9SMGbaDyPn5pbJfjtgwnN/YP9GlgAAOrHUIp/OwxcCpuBOa4/rOUIYuWKr6ecQ5lu9lUsMpmKP252c/cLMgXc+fR1SFNB/lOFo2PgxWEqmtmS3VV0bnAhfbNVAKOAb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900990; c=relaxed/simple;
	bh=6M9YqPLaKeOJ7mSiRj7yfV+8Wp+XRMcuv1t0K6U0aDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIiTzBL70MU5fcGi3VidzLiCJhNFP7CHQpZZ54UIHU/DlF69YuCylKHI6cWTNZoNa/sO9wsOKuMmipFSrOpnJyKR16ljctpzfP2spqvaC3vUbZ0IkuEv+6oX2m1IcMXzjH0sP5t2zqExBv/NTnItmY/wdLSjlxEjiPAW2NOT19s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plxY8+cJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JK+pueFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plxY8+cJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JK+pueFI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PkEp2733104
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 06:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7U6p6+gmYs8qggRRdnmv+Jq8
	KCMdmVUDO3GSBfuruGE=; b=plxY8+cJLwbeTYusuTekuXzaDnnbqGclkYBA7IzA
	cV5YudEML+Zz5Ex0DQdOhdKOeBHsBCp7a48ZqQQaxuzVvR0Fg+Bc/xSUPwpFFTaN
	F9GUfW+hJMMqSk0OTAeBNvxAIDD3Wb9HTKJ2a9oERLSenVJaJLjPGq0yVnmP/frB
	88YbGsqs+19eDcZdp7CwT331VMUVtvVhN/7NFiiyW4E6ZK16njzLes0sV5c0GSrh
	fkxCjXvxbDFx9vHn23kIOnvoVkKFAt5rJHqUvHpaoxblnr3HFq+Gpo0E8tW+0fC5
	TsQoCFTDLVI9JPNns0pVDF11BZooqEGWDJRrtUehkOWn0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6ee2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 06:43:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51775f7b2afso93390011cf.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 23:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780900987; x=1781505787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7U6p6+gmYs8qggRRdnmv+Jq8KCMdmVUDO3GSBfuruGE=;
        b=JK+pueFIGDENM+YX++BbimFR/4gVlQNuQRhHHPI0MRnwTeJXDL70QzICu1peB8ZgIg
         YPRaD0xUtOLRX1r0SvoB2VmMKg4xh+sbn10k3U+W+FxwHigL4IzcLpxWxT4uwyTwETzy
         mnBTNuHbpGruBZQm1WrRONWYKPqswjeam0je4tnCpgXwt4A5GKTxONVcQhOgqUVuCSES
         kSZ+LGhCTYqT2hpVI9zhZHK0TJRIyerJEoTHhj16A9yqFlLd6WsvfVX84RCMUJPC+gby
         9DDgUp4/kS69eILud721uyBRpIfpYED5P8xdnsnymDMly2o8yyB3wCJ9Ikb8sFDqlSz6
         lEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900987; x=1781505787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7U6p6+gmYs8qggRRdnmv+Jq8KCMdmVUDO3GSBfuruGE=;
        b=Iu6ILGNZx5ZjrueJ/0GOGX27KQo50hUl05/ZLTpUtNjxdLbyaUiFLaqz47STJEkGMu
         Umy70DX/57a+8/Hxeb6nxFyNKcr/IfT91js9nNj0kPbjgfl49PFA4r2W4HRbHq8zly9w
         EXNgS93hzi2ZVGxsOhMrKwSFvwO4wmUFa+q2lGlnZyTSvH6ngnsveEf7uWkbDh3S1ieo
         EZ7Jm6xyIvUVjdezfI92eN98xE+Cjn9iwDXPXXC2YJj/V3Nam0cCa1hnnDOL4ZUglcFh
         /QVAxrzXecmZbGcUKt0eX3ylxqNoaMHeXq+EuNuW4dIVJPVeBwxnu04bwx6AzMfmbbhU
         IpqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XglAn5YsUNVIqJF9+W64bnA/PjBgzIZV1iI6fq2wB9nzpwBpwSOJJVYCFy/J4+URxyuiIZp5KLg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/8StCU0w4+1KSEK91ZdmVgqDyvvdm63Xq/fnDUU0N7nwUp24
	7q+2V/M8L9z1B//NSthD600AnELOdCYq+JhMxNlrnv09qhmkxHdzwPZYs51ZEgA6futOBoWh2j7
	nRAKua/whwCmtM/PpVznPY+dqBzYLVRLDSP1qplUBAyy1E+CjFBIUj7SUJShvocU=
X-Gm-Gg: Acq92OGd4w27+6amKVE8Rt94Z8Awo4AdtyYqGE9emnhttiT+Jzy9EEacYTkI0pXJQ+t
	WSLtNP2YfcpJxgV/0PD9SCR8QTKAvv9kHWwsXxk+OIMy9hlhITfHv5t1TFPv0U5dgw4Llbloj3i
	xXuPUOYsgdR8onPLKaXshwutQV/sw+hkCpFAqpX+w+2okm6FLKBhI012EeHHQDUeDBlB3DfGTo8
	fEiOgsC3q+bL8mLmtEGz06EMNxiEl4yhCVPCzAl97byb0XbLMHlaXdgqjFXCrcJr4ykvm/IDC1p
	bTQ+hpXPx4iuHkKcIbUpvLR/iteIyM1C74u+Afti0YksCKmvaEfMtqevxWiOl2E3TTfJpaA0f9E
	QizNkgGu4mP+3TOsgtpmD227CZqmB7a2Z1WB1jvqq2N9fq/joEhCHr+XB5XlwsadSmJVNnwi/rY
	0VuvqUVUcD8P8FeFon2P//ewaaredxFy6lnJiwfEYyWHgVYA==
X-Received: by 2002:a05:622a:4c13:b0:517:5bc6:b575 with SMTP id d75a77b69052e-51798673664mr135568131cf.4.1780900987473;
        Sun, 07 Jun 2026 23:43:07 -0700 (PDT)
X-Received: by 2002:a05:622a:4c13:b0:517:5bc6:b575 with SMTP id d75a77b69052e-51798673664mr135567991cf.4.1780900987059;
        Sun, 07 Jun 2026 23:43:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf678d7sm44122161fa.7.2026.06.07.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:43:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:43:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: gdsc: propagate gdsc_enable() failure for
 ALWAYS_ON domains
Message-ID: <tkwgmo2x22uo3vfdaydr55kq37nezg4su5s5eip3a3f7wcagp4@nsugsvmmtr25>
References: <20260602140934.796697-1-github.com@herrie.org>
 <20260602140934.796697-3-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602140934.796697-3-github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a26647c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=cTwmTnRGAAAA:8
 a=EUspDBNiAAAA:8 a=fsjeCebvI8nJw_oLxQ8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-ORIG-GUID: n6hohHZMiY7q1_Rrzil_IEp8ossrhdcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1OSBTYWx0ZWRfX3CZ6LJIDqLIC
 tGWGU1NkJw3223wbOsAJdA7uwl17e7+GjKdeXPQGK6hhZOtPP4aBbzNmY2/1qLLHOsRcRdPpedG
 zOqD8MB1rxu7wotJqikw/EeK67rzs8SJVyCc0LfkYX4MBB0maiG3QdFUINJ5VjRS554tHG/+R4S
 1/pMuMyGD5x+igRAJZ/8lZyXW6oW+HdjzxoBijWpunVwAXbwXdQPjkLkdvHOEgtiB0ROGp8OlL2
 MVjRQ8YruoUxPWlpdTKTp6i3J6bJzzVwbZ9jTr5gJOnzMO7yGk7PIUVncTYFltSVPDNZS0EoDT2
 crSCwGPcxteE9/WTKRZb2NKhCcTxYHCXTNKu75JxBz42poHvi7B7cpHfHK8zPZYTPmpIVxjpXXf
 n5stnq3qfV6B7JPPMKjvFwzpvYbEEQiPmpLsetGwGb11dZae/d5jbrmOroDzlLF6wkEdcGADv+H
 bsCcN03mBk+kItZAUqw==
X-Proofpoint-GUID: n6hohHZMiY7q1_Rrzil_IEp8ossrhdcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080059

On Tue, Jun 02, 2026 at 04:09:33PM +0200, Herman van Hazendonk wrote:
> GENPD_FLAG_ALWAYS_ON requires the underlying domain to be on at
> genpd_init() time -- the framework will refuse to register the domain
> otherwise. When the cold readback in gdsc_init() finds an ALWAYS_ON
> GDSC powered down, the driver tries to bring it back up:
> 
> 	} else if (sc->flags & ALWAYS_ON) {
> 		/* If ALWAYS_ON GDSCs are not ON, turn them ON */
> 		gdsc_enable(&sc->pd);
> 		on = true;
> 	}
> 
> but discards the return value: if gdsc_enable() fails (regmap write
> error, the long-form sequence's status poll times out, or the
> HW_CTRL hand-off errors) the code still sets on=true and falls
> through to pm_genpd_init(..., !on) -- which then registers the
> domain in the ON state and sets GENPD_FLAG_ALWAYS_ON, even though
> the silicon is actually off. Subsequent consumer probes will see
> genpd report "on" while accessing dead registers and hang or read
> garbage.
> 
> Catch the failure and surface it: returning the error from
> gdsc_init() makes the provider probe fail with the underlying errno,
> which propagates to consumers as -EPROBE_DEFER (or fatal if the
> hardware really is broken) rather than silently lying about the
> rail state.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/gdsc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Fixes: fb55bea1fe43 ("clk: qcom: gdsc: Add support for ALWAYS_ON gdscs")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
