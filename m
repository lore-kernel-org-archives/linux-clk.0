Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83112F260C
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627328; cv=pass; b=IAWSaI0FiDVRsCBnMpfXbAqXRvk1ItGAFFoXXrLl9MR8Pw2pQ6nKt1lXT1n1lTLT7bXDRtoKGMmOrAOFt3mBS9Nyq9/Y5eZ3JSLH3EGSZC8MZiNkayuc+JKIU7EI3SMbJZVU3mLiZ4BDF5m7RPTJkfVpB+shPm6Moa8bFdrxc/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627328; c=relaxed/simple;
	bh=Cj7FBieyVij2NIR9Hibc+ljX62yVtYzJdEkLiaoTp1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCuWTwfvZuxGCrRIXXG0UCPnmu28y5eR2VEGJ9sPq4SyE3ri2F85hNDSWGis4hG1VUdGQBsi5Tinjutj2Uv+ZGewLj2g+E27gR+l1ngKrY9vE3LGVlLCEQIwri1G7R8qQ7THCuXxl2zKv+8pIQIyHUp8/Dcf+xO9d4LMAgmP8mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D83oWfnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VVxAiJmy; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D83oWfnW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VVxAiJmy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCK1UA2414731
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 13:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X8GgQ9XIrCCNcG7VCrAgj3Yl
	EyImsxHXX4dsddVR5Zw=; b=D83oWfnWxWZdgFCESIttZ9FRNu+GM9HX6Y1cp8Wg
	i1TpyeX+5ODvfASHgPtDHmw5u3fvSvUZlyYn+efAj3QhsR20Fz9H1U5/fWNpOq9w
	UmNOr5p814oIFNMLUXDK3bzR24fTbTfzB6Z3VQESQSH6RqFknmXVeLylgKekLuqw
	218BTQ+3XnEBvzMaZD1JVi6lO56OmD0ESPbxb/GnLboljNIFKjxDQ8VnLS+MEnSN
	vC4uV2r2ZwOq3jE9AO+lO5auJ235sDE055dM8nTQK/YzFc3tL134zK2KAsetZvBy
	6zn77rvgC7GQ0LfC/WY77IpKmXflbxJt8TcYVNwFK8EA0A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143htmmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 13:22:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so16382515ad.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 06:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786627326; cv=none;
        d=google.com; s=arc-20260327;
        b=KkR6HHNuAx1ENqxS1d6eYFg4xoZKzgbmkDPX+0QIoF+kCyblsWplKhIluv53dhI6h8
         BgYGvhqR3ykJZd2nUqD5sthlnJMutzFa42GCYtdEzKlY2Wuy9vMq03YZNTRJZtfkK8pr
         2D4FqExCgyyN4oC4YIKSrUJEJ84DA2y+ZrOrDLyzhF3xjvhMbpXe9h26Uw1gEWYV/+6B
         gS9gO/gsubrJKBZ/TEuCG4tgf1l10vmg9zHobBkU0+6wFSM09dzWM7J16lCKjnJyRp4n
         1B9k3sSmNiqa3JqGmHHLiuPX/G4xAV/2oIJOvAw45h17uHAsPakUIMmhLGZYnl3HZzLD
         YnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X8GgQ9XIrCCNcG7VCrAgj3YlEyImsxHXX4dsddVR5Zw=;
        fh=XFtPhlYNX77fSXGoav5UztST0JOdb742JfIGEdzQuQE=;
        b=scpba72wHbUqd8rWHO/lDOvdx2UvlvJAHNFoe5a2eRNB0s+s69N22fyPkSt1MUt7ou
         Gv4vHlCAEDtYz1ZJVFgSEZDeaol0DMGD9D+sUDVV72MG4zCsg/KIFLOHMyd+8iNE03Pr
         Bkb5ir7yaaPfiAxyKOplGUyzTu4+IBFyds7wwhBl4jPiTKNSK4wjYaSTZgAZzPiZv5Iw
         pegVAh+UGyFTKYjgUoW5aCECDKjIQqghYFu7AoZYCBwfl3PV0fLP9SC14v4HRc1eyHH6
         z3Cx1LNnTpKWXMYLBKRub/yTKl3QzU1osMsKDq887t4HrG7ugjO/w4TqXpTuKDfLOiWK
         2ZDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786627326; x=1787232126; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8GgQ9XIrCCNcG7VCrAgj3YlEyImsxHXX4dsddVR5Zw=;
        b=VVxAiJmye2/U1fJK0momiCOu/M5CKjwAwysVIrjX750WQz+wPGILXi2sYrv4nT9ane
         2CEGHlMIuMIGcpwKrej7QObmf1dYW/bzzO6mTybQ0MRpcCxji4WCTIFkXny/37WF89v3
         JTcVaoPtz6tBIQtadfYKuBRf3Pzr7DVw6UQ7/neEt8VqvnbFJ4k70rc9y15FmTl1fgzr
         QLcRSepvaeR7XolSKspgP7koZuqyvBSyyIXDeiDQxUsmCz7pf5TZvZ+bsRyzVyCmIsd3
         X2GFkeYwP7cQrDnK3eSzGm6xpxjuvMySuqNghZ1zoq9de4bNYbjSzEuyxsE4RW3ExWId
         zAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786627326; x=1787232126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X8GgQ9XIrCCNcG7VCrAgj3YlEyImsxHXX4dsddVR5Zw=;
        b=FGaovLxTos2V8DgLr5byLvmLh7vNaeqwgXh4gNhf92xN1BHiQMMbIPJEUejZdhdoau
         Hs0CAe4/rfMK0gVIxffEdx3dHVXc+6kXN8s8AbGIkyjRcedxnm0hnlIpAw9C/EY/iB6z
         aTY4dGRT//rwtTlU+4NOllEdGBGAq1OPAJ8qRhB9qasPbkIU6ow8DmBnT1VoByHHhHOg
         CCD0tivxnb5rcv856ZLjUaRrygDTU19XwC3cTP3ipfIx6AFrGswl6z9OQWHUrQWj0vQK
         TjQ9XGw0iI0QlcK+Q4frBjKlcN58G2J5dBDCt3RbZOWfz2PaO9jBvgJIoH7fXYq4Dkt1
         9fxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzlpJyrat6kdLdItgfvJdhnkcW4M4aG/plsVwFi/H5YIh3dDQzhP+gftARgNFJXwwa6onjnqiWCL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpHbBCy9rLs6HGL2iIkI3hDkyslJeEvsAnjjtqnSU2UNto3T4C
	ptfCtrKdHBxvL/MAXtC+pdDuPx1x46BEmwgksC7kH6l7N8XYYY0ThEQsW6GF9PIqQHubRd0ROIa
	5Gem7X9OAbteqjXZVm2pV5gtMcCRH7fpzmlWWadSLlZwBBaSe+QmGV/IJZJwyp+ofwxszReEtjK
	XyPe72l4xBa4EbGiQVWZV8GYZMQBEQHcGtJ4nYIA==
X-Gm-Gg: AR+sD13q+DZMHHKkHZD2KQjdO0t/NAFBbrnQPCFOOOhR8Yh4N3vPKiOUWeS48VYim3j
	ZroIuAnhYUWZUry5NcJdbZAR5sIoLw/aRVeG0yxKkSYMbYAez5IOjrT9TETZ29eWimMaleiTRR1
	J6dnQmWq5wD5Bi5ynYJ2VkCmXxScF8TcUpi7S+eD0g592mUWM4gqHVpQ==
X-Received: by 2002:a17:903:19c6:b0:2d1:d95:5253 with SMTP id d9443c01a7336-2d37e8a215dmr67584955ad.15.1786627326137;
        Thu, 13 Aug 2026 06:22:06 -0700 (PDT)
X-Received: by 2002:a17:903:19c6:b0:2d1:d95:5253 with SMTP id
 d9443c01a7336-2d37e8a215dmr67584165ad.15.1786627325593; Thu, 13 Aug 2026
 06:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
 <20260811174822.1f4bcbf8@octoberrain> <gwdrtsvqcgdfccyrmyjgstcrr575xv4ltotrdl7ml4lzsfof4b@iv4lae7446yx>
In-Reply-To: <gwdrtsvqcgdfccyrmyjgstcrr575xv4ltotrdl7ml4lzsfof4b@iv4lae7446yx>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 16:21:54 +0300
X-Gm-Features: AUfX_mxHoHpObkBUMA_LVBTzNkTZEAvDKCFJYHdEqxDVRSWTb3ocH_vdHLkb5UU
Message-ID: <CAO9ioeX-PB+v=OiuDakFE9NX5tDJdhjwvONJSmURKh1ABM=fgQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
To: Robert Eckelmann <longnoserob@gmail.com>
Cc: vladimir.zapolskiy@linaro.org, andersson@kernel.org, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        m.szyprowski@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
        val@packett.cool, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7dc4fe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=es_3XOJaTd2Oih7S2uQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA5NCBTYWx0ZWRfX8uKmIBIaLspN
 tRy+F9AdaA1CCFSoJgX9dZxU7GoObe6YYClQA8Wwoy+66tkHYLfL8F9rHtYJ/1Kfwpxh7DYPZ7r
 qwvtYSLsE5y8u10AMsYDK95ugm0v6gy2V7BETU4wqSTjqtCDQOVO2k/VNBsR6DmCusA/nEL0o7p
 ts60i3CFlNxt3PsPfB7MdvzFy1H7YZVi4P+6gsRZumbprcZvYITANVpyARC0ve58N+5mt3wr3QP
 8qgUWi+fDoV44IAykCCOh8iufI1tXlXy57Lhf6w3ZRNLJOONExiuDE8MlcoNEFdsTvTGzIZdM8b
 HyRysu/ZSmd0vOn617wAugfQ7GQJhK2Q4n4o023wvbpbMbE9jdGTSUgAEFVyMe8iIDi579Bsw17
 iz66w1jmGrN4mv29UJlBBZMXjv2nu++TN/GpzpIZ1zH4rXDhQdFYkAFH9SSqUcShNJEcINckSdm
 s8jDIKku3/y5+tMLp6A==
X-Proofpoint-GUID: HZaRHnfuaAVOfH4vGT-1YYjwaymjYVT9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA5NCBTYWx0ZWRfX3y8SPHqnDdDg
 454ixNOcRwj8IcOmkHvRJDRLHAg9P4cLAMWT1zxW9lDI/MfetmNCbH3SvoMTpsB4/zNzkkOsi2I
 kX9VGPR8No+MU1tIXV09a0lo0RWZbIQ=
X-Proofpoint-ORIG-GUID: HZaRHnfuaAVOfH4vGT-1YYjwaymjYVT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130094

On Thu, 13 Aug 2026 at 16:17, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Aug 11, 2026 at 05:48:22PM +0900, Robert Eckelmann wrote:
> > The same problem also exist on sdm845, esp with sdm845-hdk I saw
> > similiar "already unprepared" mesages in dmesg.
> >
> > Doing the same changes to drivers/clk/qcom/dispcc-sdm845.c, fixed these
> > issues.
> > Can provide a patch for dispcc-sdm845.c if wanted.
>
> Yes, please.

And then almost immediately (sorry). No. The flag is correct. To
unblock SDM845 try adding GENPD_FLAG_NO_STAY_ON to the MDSS_GDSC. The
MDSS reset is not working / accessible, so it might be the only way
forward for now.


-- 
With best wishes
Dmitry
