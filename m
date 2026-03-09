Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E643630A1
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087017; cv=none; b=CSTsCyr1iDSqWLfvkstZp/3FoAIcSZ7jUK0ZNDBxYbhT9LGnpWuMc8hiqqrtbUWyxOdGa+kFjThZI5y8Br3N6cBTBX0JSptqVeM0nTi10u338ms0z0HASlZC5jeS32krCboquHDjJ8JtjGq1LKsBsNWGBpX/Z6r83i6fJAPzShc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087017; c=relaxed/simple;
	bh=uVUG1X8nQTOgejT0QSREy1uOaQ1TpHG9u9jHzyFUWXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phYT6BTooa2qfGUkFwqdlkjpK2pmujqFbGPpIJQainbhhoSUEuwcauw8T7sPjWjYGEx9HukJUrCQYz3hNPPn/MQNTvyNL1qTycnNXHEuapLLp6sQNO0BON2Ml1CeFak2Vgy6jlYf8+7toyR6kUMtnnLrDaiTfEPF+nNvG00TZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxAk/Jpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LL8AArbO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxAk/Jpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LL8AArbO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBlOl296193
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 20:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dWiwVz3ThwkcFgs4fQusEslH
	3y0rnnNUnGOTFym6Pss=; b=lxAk/JpglZMEJWGPVm+wCrf/wAkfbRVevW8UDqQK
	ceAplReld4fo5QgSez2DxEeXJ86+wPQTpDCTwr/IJAEkxboMINY4woyNkSljcqRr
	NczwdKTB0pTPYroqYioZ9BggeAcdoxOzJNzvkRgwdNtFyA5Yzqm1nXCDt0LwVRpV
	cj3v86z2m2mjMbqvLiNT2e7sTYKMUhW18rL4cBo3hXWJU7BmRNFluaTMgfa56xjs
	gQIRswFE7AfvhVrfcML6Uy6XiumFDA2Kyj7KHJ8vGHd6g9vwqPP7GCawC30zGa7s
	L9LOiYLmwCnvFut1ZxLLBAChS6IksEXoml4FT7zuv5NkNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1bkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 20:10:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81be6f05so1006471885a.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773087015; x=1773691815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dWiwVz3ThwkcFgs4fQusEslH3y0rnnNUnGOTFym6Pss=;
        b=LL8AArbOHsCzyT46gMtYgGFD5+Ung9vByXrDlzbv1lH/ZfB4OccDpvN6bFVuLP0fGx
         4PmUT1dqzDiuh0p4hMGNfLnc6cOgb22+NIwOzGQFQfUU8FRl2hEAV0U/cLvDUrE9SKuu
         fSOHN7KpOkdHWj858vr6vfCK433rfIcsu259ynbsboKo2uiC0F2BDkMSYqagzzJOwPcd
         Q4/A7IoZbjrPh2QpxyO5tRgxCPnEbMkY5A0W7dcGzRNBMt8zeEM5u5mcR73R0PxRWA4R
         ylzYXx/mmwNkYx4vmSdQRR6GS15AECeDBxtH9ZDfcidUT35UeUcrAa0Or7Hk6oGCs4VA
         ANIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087015; x=1773691815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWiwVz3ThwkcFgs4fQusEslH3y0rnnNUnGOTFym6Pss=;
        b=G9+fvpHOsWuiNsm88VNXZZ64Iw47wf2/yvtSqXvL8ydq4xrP8WPGgE4W4X0NAfYY1J
         ze/e2NM5F7dT2APlOlwNI0VZOOuxwkqfydyVqqAssFfCEssah16fGIGJ+SzWEKLTIcTz
         adHr3tJ2vLEEQfT0h6P47wPuWYor6NEckFGtgG3VUveJLANiFKN4bU3OYCQGjQQxIW7k
         FJK3GmS7zqBAOAldwXYoqGKSFEI4kMuhpJsYUEw3qmzTKtOj/4e/AyTI1ooixht03pFf
         NG+SIYcreFBILxSVeE0z1t8jCSjG/fZ+1zaPQkPDzes2wk+P+3WntKwDlqT5Shx5GCGi
         ffqw==
X-Forwarded-Encrypted: i=1; AJvYcCWf6rQRp6gUJCiOyq8IEovQ2MbuxpcJxGV8ZmTlabO5IdjCT6ABuufr6xzBuotzps3psqzG3jHlLto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0LqM77HbnEKpiIyMMFEcQ9CqrfLwxRtAknyIl7r8i0/dfhMS
	oW7PO1zCGZK1uYIKrTzVLstb4yz2Z+6khtKBHzy7AH0CduQpl17SChb/fBNlrHboyMna+UdxG29
	xSdUU4ffpZwO9C114hLqSk+PtoTCAcuUcRANI/aTd+6QlwE8RwMcPDjWBg+W9ShA=
X-Gm-Gg: ATEYQzymygZdUGCtf7bmOwHBnIxnVF85jFwuXcaqBIhMQ/wsQMSLtrUFL57GXfaXsbH
	scY+V86dS5HBWAsxa/eU9/Y9me6/0h4IFY9M8tUW6hpd/caZ9801X+BL++t+BQ5DePAlLJ/T483
	E9rcWwLJVcWgry/8Xt1Ld0+un41x+Jt6XnIBNLkEjFyfEQTapwfZcxp7RqFMvt8SPi7uW2yWy8A
	bU1EDiteatHTG8PhgTbmIjsmFcRWT25/5I5gLIbvYR+6zyS+kzyi5XVp2eADgUpyw97PwcWZgHI
	HMj4ZLyGzff/VrzfMqZ4WTjjnMI5yORR4EBKFDk0UbT9X3hwdP/+t991fzNybPZwygYgOV8wRdy
	2kzEs1US5KfbSExV7U+lVIEnWr8rj4mG2CKuDg08sLomkk558YfnHlcVrPKqrFD4wYHva0FmRRb
	sGMckA8Sr9jUTvWofm/SWCa7dxzFws7fbgWpY=
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1559636885a.70.1773087014888;
        Mon, 09 Mar 2026 13:10:14 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8ca:2baa:6658 with SMTP id af79cd13be357-8cd6d4f7dd7mr1559633185a.70.1773087014423;
        Mon, 09 Mar 2026 13:10:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d0726fbsm1135151fa.41.2026.03.09.13.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:10:13 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:10:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] clk: qcom: gcc-sc8180x: Use retention for PCIe power
 domains
Message-ID: <uu2wdb3so7ht4uam5fisd6omamwjz7gy4zp75ddny6vyxwxnuj@ye62osajcmcg>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-5-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010214.224621-5-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OSBTYWx0ZWRfX7W+7Z8qcizOT
 mQm7COKNzLjtC6Fw5dkyrDPupwC4Iuwvw0Z2KzpUauEoiEbC82fyHnUqfkCBKjQPzxivTHu/Orz
 +oRFBjG3wl7ZtjWuHgraz92e3hfqHkPve5MqYIKVt/JT/EKQVcPVUsFvtThBTdwVMwpdE/MyKjY
 SnkLBRGHYBjmezr3v/a1SxDx7r3SKbvkOK6xAo/Jl5B3EQBiAq7G0njVpufBtRpo/TEYHHBMjIg
 UtXqMLoa8TFpW8YRULNiHvuc+LfPk+qSM5sg/3nIp9k8X4Dd0O8pPml4Kpf+l54YNJ6PMqUnFSO
 aplHxNMdlPvPn6ODy5gIKkpcPBDQzgWlXp/rN7shHdBQos/+Zf1KjI8ZGXDSOk7NC9sZdS1Uhi+
 4+Mugc4H1Mt+wbKEbAwUaMF92FGRaTaq1AKRmDoJjtmLHGaYiDQBEJsN2GdkJ2soR1q28lBHoOe
 zVdspT+UqBHr+8b3Jnw==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af2927 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wNC1lQ1g-FioslJNlOwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DVVydMPJmzWT-Gj8I9ts2joCoMRvtyJj
X-Proofpoint-ORIG-GUID: DVVydMPJmzWT-Gj8I9ts2joCoMRvtyJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090179

On Sun, Mar 08, 2026 at 10:00:26PM -0300, Val Packett wrote:
> As the PCIe host controller driver does not yet support dealing with the
> loss of state during suspend, use retention for relevant GDSCs.
> 
> This fixes the link not surviving upon resume:
> 
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS read failed (134)
>     nvme 0002:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
>     nvme nvme0: Disabling device after reset failure: -19
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> 
> In case [1] gets expanded to cover all SoC including this one, or an
> alternative solution ends up being implemented very soon (looks like
> it's not going to be [2]??), I can drop this here.
> 
> [1]: https://lore.kernel.org/all/20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com/
> [2]: https://lore.kernel.org/all/zfs6krk2whthgdjl2s2w4o5pjwimzw37afoiyrqllykrk6jugt@4ijk5iqplohr/
> 
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
