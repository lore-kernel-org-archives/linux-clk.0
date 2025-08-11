Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F6A221721
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908413; cv=none; b=LeGdLAVDBw160yNU0SDZ3UDJgr/j/OA+uNziKIVEQKaicTSyjDgsx1b8Cyi9BrgQ0TgZnKS6EU/X84Zak1Q/qHWah3F5RbNJfMuLZqC/CZpnMYYHuyc9/35cFH1cbLIWBIPQwbI4lKC/0OwUmI516QZKWw2M8YiNX8ej6yP8oDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908413; c=relaxed/simple;
	bh=kHespbBD/Wze4n3BwKAN4MIeNGa9Z3EOBJc+ZThJyHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiHyfJyHkxJwanIoRFHcDIv+56XE/Hh8YNc+sOSE5A7f+YTeq8xPe+Oo73Ppdlfk5sKHRvgdh8NEpadFsQlmR4sTq9LI2PRZenetDWk2WZL/lx19+eqL8529mW+4/CcMArEy2o4VcOroeo1veludfdM9evgAPvciUG09lBCvgIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNwlm7V6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNwlm7V6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dOqM000912
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xUcHQjufN96j50i8isc5wxtk
	0rBCIWP/iFq3mpKJof0=; b=gNwlm7V69ms0r2+cku8n+dYK4oiEv8wxmw6sru2F
	Dk/5KoJBMvxCi9HJT6QDLQ3Nett6DKGwwY59zakWxEg40Ymp9nzDezXM+OJ5yt+Y
	1nY0GpVWZ/6hbiswN2N4c0/hhvjImsQDCzoH99Ig5NZ2flAhlrMleMnIcT7yPyB0
	0Chrjc6IHQhVTqXz0vSj5b+ERott85Z80cfK7wk9Vx+acOzAo3A4uwvQ5pMt86mn
	29iqKTey/mXBSylxXJI5iJcaqO1N2np4T746Z0sArngEa2PJfH+oesilWmOIwypI
	Ply3VV5RBqbNi+32nC14rD1yOKWuh2sTgeS8+cT0fPm0ug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kyge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0b507d014so48247621cf.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908409; x=1755513209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUcHQjufN96j50i8isc5wxtk0rBCIWP/iFq3mpKJof0=;
        b=YPWU8E2P9upOoMKIy0wDSy6izZiNGI9ZZO61mBZQMyvaSC7vo5XacbAtLT97OgfRE9
         Jqgzsu4Flo/+pijtN5pLWaKgezVzjPXSmck5Dc4ZjriK0ethjqC/u5Ph/9KbaH6/eKY4
         6Q8oblRRL5dP7ho0smoytCEgE4nLL/Hm6/kFVNqex63cMuuZ69H/9E+jvcbBWlM7yW1F
         Mt9kqIJAQNjiNnDkhmhWwWfI1QkwkbJqcjoq/fC4QNRhw1jz5Xeh5KmjdChtxGXNRDZd
         aK5S3qfoi9Sk6RIDKXDmp5SlFz8qunjEhSRc7UOgz3xL/ygaH4TVCYkQykj2hAhbsHJH
         +ClQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg1o+Fepg/3bzfkMBnGaO+HaUzEOP26/y5wwrwnFvygP3JXqkNYctvermMtFqfyTLuItsgwNr8GHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1zjZ0re0qJ6e8p8lSqtirDngXE60tjj0KcXJiVnMlOjhBym5
	E7+7i3GYNJOppru0IKcaGgRiUi8yqskJZIjn4ugf4jTuhx2cpx839It99v91v9zPI+yeXTS0vvY
	ac10vqm7PI91sxei7g6hO//8+mLdJWft6SD+BXEVAZ7jU/ppK1pzJBnN/OHHBrG8=
X-Gm-Gg: ASbGncst9X1mwQFV54lWRGRHZXKLyoE3zxUzQVi72KXpz4GxdXjPYw5DJ4DPlKkyIa7
	2S8IysCj63zi5wjyGqOq2NYl1yEcRg27RxjYUHPmMXmVt+shdigIIE23TRGB4BpJNUVJ3Fee6Zp
	Z0g+gpKZ1wLVFlser9vgldUbrpaQUWnb7MeMMoH1AO0XgGb7pyncyOl7/2WLzZPfA7tunHRR973
	xzpJogWxz6Yz32luqCJA+wLRN35L31ZbhMKRAdvDwE68SwLepEnzCwNzWk8f3h0SRi1fFT0Tis6
	m7FAJgnYryE3wg9BzLiqT6eYIARr9ZYFRhuH1g3aYvU5c3fEfNb2AXO4qvdglgYjTK3Nnwn0wUp
	a+nHPvvhnhL5hX5wMp1AYI2z5UI6WpV5OMo9HJUXeEABmzlK8oQ2t
X-Received: by 2002:ac8:7dc3:0:b0:4af:1fbb:3a05 with SMTP id d75a77b69052e-4b0aed802cemr172661041cf.58.1754908409487;
        Mon, 11 Aug 2025 03:33:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK5+d1EPtwxEZN7NaQibr0TadKLirlbN/cpnuNlgXjLHPDePtrYQxufGwDmRoZ5/mmER8t8g==
X-Received: by 2002:ac8:7dc3:0:b0:4af:1fbb:3a05 with SMTP id d75a77b69052e-4b0aed802cemr172660611cf.58.1754908408908;
        Mon, 11 Aug 2025 03:33:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bddasm4246799e87.39.2025.08.11.03.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:33:28 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:33:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
Message-ID: <m4a5sw7ghzepzjh5rzxltyktmgqocaacbkulpbwsl2alqbqjhs@st5qillinrnb>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
X-Proofpoint-GUID: VX_62RN9OOP7Ek_OTycVLf1rdFz33L1t
X-Proofpoint-ORIG-GUID: VX_62RN9OOP7Ek_OTycVLf1rdFz33L1t
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c6fa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX7cqyaFZ4pFOz
 3q9uzleo8HazOCg9KOk4tUYsIsV7ILl0RDuzxuUxMaKcFGr4OlKUTPZzkSycdaoTEx3HNFzhpdV
 GW/WkYTY0ATA11+lN3Qf/aYgscgSdR9iprKaoQBVb/ONe8X74KG11b9+0Ovvj0DuG1eNn+f2m1m
 smiuvIEc5xoU4j0SQfuG39HlmzYxCSpbspnO/qV71MmFyWhVGFzUTac52/NcpbpUC7yRJk8Oidy
 BYPlrTtj8Ii0dKVesE9erKzLs/jKVcNTXYdehJFA8ub/jF72s4Df6TjoZ6Afj6WdvDeNRa7W0pE
 9SKaRxmy778feQCULBbX8a99voLwAG54SSZDulm3r8MadC8W+RBxZPNEkldTpTJmV6BzydeXM7q
 b4BMdjET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On Sun, Aug 10, 2025 at 06:57:27PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 32 ++++++++++++-------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
