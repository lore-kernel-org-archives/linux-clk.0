Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC99B28C2A1
	for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 17:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013817; cv=none; b=NvJc/L27EWIQXbiofxKFcEIkP6w7jngQmcA+FwpDb1meSzu+onUDpr38VtNO1+AyIiTCJfPNbuMNDedm+5J/8Jl8lbD+yhdzWeDZjiUlC2wmgPwP4VFyBRKUR73S+hxp8F8TnTDfBeuDYwO0CC4iAdVNZWUvKL/iLtGngHAn5mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013817; c=relaxed/simple;
	bh=7F/77yW4CDMAwOZp3eERP8K4l2ouAqLz+cjdMwkPOCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuPTeo9neTv8IcibtuAMMWyCvdq1J612AENAUGQcMQDFq4I1LnDxUUBTejkEOXrrSjYUl7aeAeLbcx5kFIBy+ZDUUuMYVkBtD6blCSIi9qKyAE1Ro6b+bqaei+6spaVllxMw4I7YtyLNo7SBq6pKuLZAhd0qc9j0/wbXJKSxFWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDp8qcIe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNEdvZCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDp8qcIe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNEdvZCx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE52Nv3689682
	for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 17:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ssHb3cZNSYp48eK2M4UtQCoJ
	dgaqvzLMI4+qxv/Q2Os=; b=QDp8qcIeJ/n93bAPX9cn3ALs5ZVssaaHVjkHFQz9
	i5q5GTaXb4s2nRteoCFg1X4J+rKwTH/Q3yGXYTTInoAl/wFyoDSCOwAPAFqGEa/D
	52L/gT1rf8mDIlRkgGQthNPiITvbfyil/QFjDf8zEkIV1GEMKUkJPV5zXX4rmzeD
	7r6yIeckWq5rU/2zGVj2QujAGCOU/Qd2TGjl3tTuwEidJQg95P2ntsZY2Z9bLIUt
	2PGALLVSYbOP/0yKQfGNVjl7qjAZa22k5ZoSvjbC/v0NGrhUTHcGCjEScYmn56t9
	3hv5XOFe9zveTSvpxYbHx8rTsljYJsQHN4zBHpNZ+TdGFw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhtnrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 17:10:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so28562321cf.2
        for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 10:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776013814; x=1776618614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssHb3cZNSYp48eK2M4UtQCoJdgaqvzLMI4+qxv/Q2Os=;
        b=HNEdvZCxQu3Rgr2K/KoXn8SSBtgZelQO16LrXpqB/UR5NNxp+kXiqPlkqBilQJuURK
         LxBnDC89ygrr2L2kTr0wQeKj+BU/7CZ2b9BEKAhLadfQfBs+oLlZLrLNl9HmbrS4LRpP
         GGiB1jYlx8ZNUpthEQw7BL/QL9HCFhrwV3LBstpfy0DIwH7MJ1SJWcQ6xaSsteaIYCRP
         uW0g0YpEU52dAaZEPm42xXRjhzrDQPejmjuP/VkrBDxOYt7BGuQo6L/9xUHlg6KBMycj
         FQ4IxVuCG9VwDc6eAWiwSAfjbBjATXX1ZRUiD9RSMoHNeApMx6+I0G1QQgnD4BSpK+mG
         c8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776013814; x=1776618614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssHb3cZNSYp48eK2M4UtQCoJdgaqvzLMI4+qxv/Q2Os=;
        b=GTLkhG8xojSB5t3RXBVA0huI0kDWjbs+7WWb5yebpcoiNVONf7CuTtFI+oWR2TLCWj
         +gSPuTq51t5bwPW00p34OC2Xtef2RC8fYZMqPNuQmQyPb8vP0yUzA2CryWAnIMXuEiCa
         Mpjhhw7hXmLnDonYrk6eovyRegdfnITZgv4nLgwWQa9pcDC1Ov9jRnwft4bnar4RkdUn
         bDSPuPiWNxjkTiEtgeixHvtbc5RfxfrBc2L86bHSUb5oX/MquTPWG0mvDeXdciyzcdim
         CE+Lf9N2BmN/nLkygbom6x04wcI6BgxR5KRh4SbxKRGEjpCfqmAoZqioMZJtAXqWlios
         cksA==
X-Forwarded-Encrypted: i=1; AJvYcCU4YuigdFdo+QNlqI9972mtr1jEm7tj9CpgcrNnRMxy5hQTAueXVs0f1jckjLU3B+Jz6lx4XFiUKng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Duac4Gbl6ugM6hKt0xUB6wHo9XuGpyIEcp4UmZhU4I4rUM7N
	gPvfBBtr8wbBzb8X0/NawKAnOAIv+UFsmgE+TSe4wvTbOIyGwTHMmJIT0zJ6BmEMc2KHqYIOknG
	za5/8ZtZK387aI0zXH9kDrlfmmIwpBq6BVRW0RYAKreocvs490Ym0p4/ooPqVNuI=
X-Gm-Gg: AeBDievwoa0Tjy+WiQrhOWMFKSXdYTXDMid43qQ9Kkozn31s4zBH9d710FV991Y+TzP
	ck0bqE4xmM8iARzbvHhJdzp6pskDz9TcLvpl7xVgnltCw9uemoU9J5a+rFyyLTQPcC8VuEcvGzV
	w0WkRwhboKBILow8uYo7+aZiR5YJ5Lomn3QzDm/mBkGft8IPTON9rHRgfbtUGYpj3hkwNDj/7pd
	3wHTRbM9ilhH8BOLbNfgCssIoMwkWZ1JsLRi5+rLBZFPNu8Y1Q7HZioSXiKWCEDhbslO5HcWwmZ
	w7oS9DBINuoMocqYa2RF5yAHJ1Iz0VAThSgn1FT7uBwmCnUadWQnJl8IP3ynyxyac1lWuOd1a7T
	YjkQzPH2dFSNEg/zgrLavEhVoJpoemEHmCh3F5nya//RqaXBygyqdwi030TmO1AfdHfYVJUgsXN
	GPf36C42IjO8NoOgXzDIqIV8DvvNvKQXh4U60=
X-Received: by 2002:a05:622a:d01:b0:50d:9175:34e0 with SMTP id d75a77b69052e-50dd5bab1e4mr151291181cf.40.1776013814025;
        Sun, 12 Apr 2026 10:10:14 -0700 (PDT)
X-Received: by 2002:a05:622a:d01:b0:50d:9175:34e0 with SMTP id d75a77b69052e-50dd5bab1e4mr151290731cf.40.1776013813635;
        Sun, 12 Apr 2026 10:10:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4929a0a5sm18870291fa.14.2026.04.12.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:10:12 -0700 (PDT)
Date: Sun, 12 Apr 2026 20:10:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "clk: qcom: rpmh: make clkaN optional"
Message-ID: <rxjdw5cc3zn3d65md7ebztk55rmziifqxlctvn7ptfqmt32zls@cy3j3tkfpr5w>
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
 <20260412-clk-rpmh-vrm-opt-v1-1-37c890c420ff@pm.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412-clk-rpmh-vrm-opt-v1-1-37c890c420ff@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE2NyBTYWx0ZWRfXwpo6LURHEb/L
 airc77NwT5v62tM3rT2aA9yOnfK6u1Oj2hucg6yo1g3ZI8hntOyahMlxYv7Ti1hi3txjJz1Ua9K
 sUuSEwKtqcbWeImuu+6fkXmssq0uWa4XoBVIOsmSYoDG/1f4OR2cQChRLbhyrXjcDBNtuXvq9eW
 nBSQKGuvoFVKWDmL6XsBmVC4XRcthRkKdq/NxC+QZ+x+ZP3VDOYoJ7ivE+nbVznXoO0fwwyGLqs
 s3NhsKobMgM9vBcV9875gONJ8sjsbf/zl1XJmPtUCxQDl9sEF52N3ASyXqqzu7xEdycTE3zWKdJ
 cIglyf2HaCiKtcaY6CiSTqxfdm1bo5BgDzPQoYOI6QEwBrx+JOQs25iCfDJHOM7olJcsE55RPVV
 y/54IcCE2ad0OfSfieLlErah1ewu7KHe28GfYrWjQ4xp2sg2p7vPzUiM6Ixv8SrV96JPa+uMVGC
 7zcF9jhM7QRgX/ola+Q==
X-Proofpoint-ORIG-GUID: Yr6qWQkWE7zBBaKG1GCzG_vIkd2qLjiT
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dbd1f7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=LHHdHzVBj1RI9S9w2dkA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Yr6qWQkWE7zBBaKG1GCzG_vIkd2qLjiT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120167

On Sun, Apr 12, 2026 at 03:30:52PM +0000, Alexander Koskovich wrote:
> This reverts commit 166e65bc6ce317be41368d9340b870edbdbaa2aa.
> 
> Reason for revert: Better handled by just marking all VRMs as optional,
> instead of needing to mark for each platform, done in follow up change.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 

If this gets landed, then between this and the next commit the tree
becomes broken, which is not nice if you ever try running git bisect.
Either squash both commits together or change the order, so that the
affected VRMs are first marked as optional and then you drop the
clkaN_optional handling.

-- 
With best wishes
Dmitry
