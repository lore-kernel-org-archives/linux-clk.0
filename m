Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9021373C10
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 19:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206701; cv=none; b=YL9NSBMdAG/B3GL0kUhBYnFSc8y8S1dEcH/GnwvK/r2olNKWlqlFj377/yJC7bHem/n7VwdZRI235ilAFbenB6IY7agYGr1riUMQM2wRUN0faTz+wJONLA/wxk0h/Xcat1kQF/w6uwvQUyfg3wbRUrJuOzQitY2hWpMBZOuWMOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206701; c=relaxed/simple;
	bh=7hkSjJY+5qAalIOMNN16ZBL3kqqDiL70XFRIEDhKuTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YW9ycN51Ro8Nq/iy8IkuHIrNPILkCehMpViq85xFmAJ0xuG0YDp1cny8YSJ9+pElLYLyuUm95KP856f7twEB3CwBBLDP62k4nVcToJLvg1szTB4v/qDbc6x1rzjfzoBgrqVhnbYEXELajmEEW7LTbED8Ae+b22C/1OS57mDlMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZa+QAX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoeUuo3t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZa+QAX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoeUuo3t"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3Imc1479412
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 19:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1sL1PtUuVLMR9wGjll9GVuJI
	vYSgxoz9V0tlbCz4Lck=; b=ZZa+QAX6SgDEMEqshtNxda1HmlXfXWvFPXh8iILg
	N42/DCuaXBP6bZdHBDn1HevC3o8ZN5VloMbmENMYou/TrzPHZjxKVHWvPmjpUVUC
	yZKB9Q7K1qoWbMydCIbXmEhDBUo4Qjcf9exFGUuHUwmN8w/Nggv+Ekt3l54bIPdS
	ia1oMMiL3Xc7duacc9+7NFgSHWr5vJYRVUvQvZT1mVgEynHRy8WYruSxBZZUg2jo
	nNZ+VwbLpd4oYCTU7R6MZ1eq4ThEmqCDhG+fbFe9ok/N9xUIDnxxKJnOv76TByue
	pCBqhe9a+gytHK65M8OaI9bHJs5WL6bdPdwdXTg4JWhoaA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7gqn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 19:38:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963aef8141bso81113241.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 12:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781206697; x=1781811497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1sL1PtUuVLMR9wGjll9GVuJIvYSgxoz9V0tlbCz4Lck=;
        b=eoeUuo3tpWoqEcv8TyQnRXSkYAjBfas/Tio8m7/fjDZjAQ+05c0XwsZky66un3izmp
         /5fexGea1+htdfkB66x0lLnXelTm5+3SdlBKlxzDmRWnbAQdLpBs2Re1Ao1I5kfcrqri
         H8Y7Zs7mpV4ZXUtM5uFWrXYWGUDUMvH0HZcf+XNwlCK6RTfb/82j7W7Rdmo63ydS+Uvc
         DNfh4fNc4/W/awSf515gsS6vQEfO32R2KXNBCKXlTPnUiGOSC+AGiq6Uttas10DLWRL2
         ejMT3QqLnL8FAoT4tuk/bf5S3RMq9OeJMBM4RhiosfN+e6xWSDq2CDENIGgghIQMtg1C
         9McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781206697; x=1781811497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sL1PtUuVLMR9wGjll9GVuJIvYSgxoz9V0tlbCz4Lck=;
        b=UNsHjHg/UZycQivP4/RgxzEhjpuAwGU4X+W9QNKo13rfkreH8iHT9eWn2UaPE1C2Zd
         3Xd/pvs1aS2hAemsvop0i20wdeaW0iM9AJAkuzS96Yao9FBZYuWRCb7N+u5gzVw8eTvk
         pdL9dR0HGw072S6VmTtglWy3Mx1Cp9vjuBHH8W7usfaBYW5zASSLmV9aWH6o93ZEuA86
         9E+RmdSctVIwUfhxa0B9OR27vWqkZegFcOk95glnsUXVnJMXXNV4RphHOWyS+Sd4CM/n
         2mkj1AA3Wf9RrasApCeKDnUd/DbYk9HdKYjPFrS/VyYT1zwfyZXmUuHdgefgf6Bb0Gxq
         SmiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zGAb4NixhlRf9Cd55mzfuBKdnsPm6hlVmjgnTSnUzYXU99XxYgLtN2h5rNAumokmApfysjLU34wE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyetmX/X5wLAw2zsNgu3a6R49+9am3nK3NNe9qPRGe623q+idio
	y7QOOLNRaA8X8a3YuO29tGOKOd237vm8ZLZiarYo9CfpdmdJFWcNH4dDem2fYXz6oLSyOzLlRoA
	x2bQLWw9UQVwfSQ48aqG9uAx+K377InoCdjRF81F+eMx6dH1PvGnV0ABkS1QkcWg=
X-Gm-Gg: Acq92OGRrVc1/qKm1bJiUxk1662PVCj3P8UXZnQ69rw0n9bxp9iUBzgJBQKQ8qYLX4g
	pRwWKXdG6HSRbIkJN7V3quvkak6jsL4Ff/Eup04OuAtol/HSlvzWN7Hx6qs4IDk/Ggfj7aKl0QE
	xiRRNi1tlGfc8luV/e762+a7Yq2IhSia12pNtmOQv9/kFIEqPxuHpVBqWndJe4cnYVRWoNYnqY+
	IbZRgu2pGdIZz98qYA7FgucA6XzvlVcEVCRckRzRMYZ9H8C/fkTIXwHtA+YA21RLVG2vVb+cHxE
	l1zCDnURq4WV1fFcdMlqiu6n5x/mXeZS6zgo2Hc6z/G2OXjnR2OfUcln7ErM0ND/Gn/b4m0uxpA
	lBHkQuvy4WRQMezlFdhT0rKakWAc11RUMd49INjvXdObDMP1UnUs8dkCw7KBqgQWpqYbKCXaRyU
	JnJ9NxUcBpmjFSec2gR3xRFYQ4MUCTrWREMkQ=
X-Received: by 2002:a05:6102:5e86:b0:631:26f6:7009 with SMTP id ada2fe7eead31-71d5fbc840cmr2904823137.26.1781206696782;
        Thu, 11 Jun 2026 12:38:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5e86:b0:631:26f6:7009 with SMTP id ada2fe7eead31-71d5fbc840cmr2904810137.26.1781206696303;
        Thu, 11 Jun 2026 12:38:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd966a8sm94272e87.70.2026.06.11.12.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:38:14 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:38:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, usb4-upstream@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
Message-ID: <c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
 <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178093139446.244194.9422100472802070367.b4-ty@kernel.org>
X-Proofpoint-GUID: wmg1j3jXynp6izeAGdI6kifF45RO1mYK
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2b0ea9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=fRhqCqpcSqVtSrmxR4wA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5NyBTYWx0ZWRfXxwN1kwTv578E
 N0kJMOItt0GPU1rCvzClo7USHJHDoYXNdgnNu3j6raXciG9HBo4d6WqrzrXNaZq30CK/+nNMH12
 I//FuUovoQDy8sq3CU5ZiRvQBSgDBvc16Umrl0gcaayffv1Eyt510gGZwmiRC8ER9q+mPlC6kbm
 d748K70omZMeAtgs2Bum+Z7fbuF9oPvjG2njVRXYMiZXKvAzvFLYcsUNAVvBnrZ3bhhdI5NaYB5
 P5IJQz5fALqaw0hbiL0hnS3eJKiGs250ZYB4hsjNYo3ZEPIXHnlyszOFfr3ij3Vmucr4pz/MAVN
 8ecbz9AgbH4a5h5ZWq3YB0CdkC5OQXYkGdLKzeEYADdHlPoNUXX2wZa5kjQtVjlWJZfBO0Kz0Qm
 0vSxF8f/8gg6Y02TUpSokreX7l+h3jpsSb0txa+OmokhNVMuLU+M24zps6QlqwEpXwTb/boPv0y
 WqlsXDbtJiBWq4hoSmw==
X-Proofpoint-ORIG-GUID: wmg1j3jXynp6izeAGdI6kifF45RO1mYK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5NyBTYWx0ZWRfX6c4uO5rX+nvy
 rNH580av/yhNBpdNUUFMwFJeG0b0lFxCn7300AVbrKGvs2TL88LC2WJrfctKhiigH2PFa3zwXD/
 LawIDalC2gRShncDboGi/NqdG7jndv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110197

On Mon, Jun 08, 2026 at 10:09:55AM -0500, Bjorn Andersson wrote:
> 
> On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
> > The sole reason this hw exists is to let the branch clock downstream of
> > it keep running, with the PHY disengaged. This is not possible with the
> > current implementation, as the enabled status is hijacked to mean
> > "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
> > 
> > This is an issue, since the mux enable state follows that of the child
> > branch, making the desired "child enabled, MUX @ XO" combination
> > impossible.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] clk: qcom: regmap-phy-mux: Rework the implementation
>       commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c

This breaks at PCIe at least on SM8350. The attached WiFi card is
not detected anymore. Rewerting the patch makes it work again.

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
With best wishes
Dmitry
