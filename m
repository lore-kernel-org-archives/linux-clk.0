Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7413E00BC
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943771; cv=none; b=n7cq3bpDxrOgoCJQRRmsGwlLZL0mVQQHWwoQS83vciPVTFo0dky91OGZydW9R8pZnzQws1BNh6IuodUUmYFwHO3DTz9sSGEXNrLpT9mWA41IX1CWrt2icU2WnDNlVQFV730898XjEfOvH6dsc0lXnCKofOEUJE8Bh9He8Rd5FqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943771; c=relaxed/simple;
	bh=+X4pezE2922d596Af5ASfQnVu1TRws/IydngxFVvotI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YE9hzCnLfe/gabrrCCteRSHVr0vkVjnFs2NJRlyYVqFzUxNLTBn+5rSoJUgfad5SQFWONICEYdAxWurcDAYt3S/RxyG+DL91xiDIShNtgzroiLBJO8tYLIkt025HdNpU8k7KF+ml/F44uzboiXAdomucte8t5BHHEuWN0xezgBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/MZx9wx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CR6ZIrgG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/MZx9wx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CR6ZIrgG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFbgX3552838
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 18:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wxwTllO3Xeua002xBaThYp49
	lPGhAz0Nblos69p+78w=; b=Z/MZx9wxfzFDrntwSanVF38O3t2EX9uPwECseMfW
	Ahi9H2LtV/Z0fBwxAmmwTcavWbBkTNnBu0nvTm/778OT/8lrDfH+nkpVrL+ybERl
	Z24corn04QuL2vAttWEG3cNngAdbtuo0OyN0x/p79VZAdbEVs58128Av+PrW7M9u
	zjwD4V1WhFWGyCSJjCv9r5hJCBazsPeikKIgsEznKRvjrCdYoTWWY8YJHnrLz898
	JCxiJi6c/Ss8RWGF/ectf+d/dXY72LID53/pRnLhr0XcEHYqAE+A0RInLf1tGBc8
	1bJG5TGEdKxJkNXY+d2sk2X7zJeoYxkPitCb4oqTW/kmKg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunaad3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 18:36:09 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6798c46f723so2562423137.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 11:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780943768; x=1781548568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxwTllO3Xeua002xBaThYp49lPGhAz0Nblos69p+78w=;
        b=CR6ZIrgGEu28ugR11H98UcIqu/yz5oZeDSHedKIefKwEGA3aFljwQPVaaY0XzHEBqL
         K5a/5Y+RTDsLVDJ2ZdQ9nQxDP8nu0qVImFPjDDgSxjSxvSXISDVSIzDuSSqvoHkUb3+q
         whX0ptptwzQQwsrY3crlaWjuFe6a4AgV2fSUzMN0iusaKxMfOlx7YX4wgvD2AD4uXgpU
         P+E63CYS+xKa2c1DRl2aBD3A5E2TG/cDh8NnycB8WRJ708STDBx5oYMVD7GM2POB0Iln
         TX7DHlH1BMsN3f9bNgyF9BQntVWK2EkLdK1xq38kt5Mx/02EEy5uStn0kB0GGKaEgV+r
         QWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780943768; x=1781548568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxwTllO3Xeua002xBaThYp49lPGhAz0Nblos69p+78w=;
        b=fj/DVIiLvOUqZdXAYzFcMQGkbLpRLmbtMB9hiPWfENLqC2531hPedjAgs7z4kyXP/e
         JNQhLcTTRXpIGVLx52t3kZj3ZOgqc54GwuicV9DhvqDEVZbFRIemlAnCpl9w9FrowXHs
         n1VGZgh4p3DXXDc3By9+iLqMs5q5DewnEXAZ+GM5y5xeDgJqiRv1TfSQ7aQhX9JQcVfD
         68xtVsddGOLAxYNqBu24YKRUmWnFJiQQt8Mb1vHypwmQPx94+zjroMOK0WbFYDfHytyQ
         W3RaM8TVH0GXnl7RrU5eIJupQzCt8EAo+OYMpT+rhwLZYxigvF5nk1GOLqDFMsAVAYt4
         TTFw==
X-Forwarded-Encrypted: i=1; AFNElJ9icC5hiCC/vIAS6JEDLMjPMCfgPCh5JtlsXv+ridS9rFgKI4mkZ3RCQtJbZLBqSWlVaDKc4u3qCrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvkq8pmxLDJszjSwIFlVYqixvyluIhlp2lY7PIuEgfhGL4I7+u
	wXhg9iRDz2VZ2YWxCd/6pad/A1J/mZ945SIrIb9EJOwte4Rv1m3FzAOfDYQGdjyRxchFfGTQVNC
	aROLxhNN+6bZbPu2/7MBOwU5z+5QfQwHjrk5ir24YpYgnDAd14x3sMDuw9mRz3tU=
X-Gm-Gg: Acq92OFTkhPH7iFtPpDwUQg0h5kh0p4mvN/bi+qN6jCC9ZIkPk8+dMpCZUu56296d/k
	0hhtjuJl2gbnOWmLVlCzEHU7nsptUzH9suPn62TqU5/aXaHPMq11YE2hvDbqWI97Wz0g7iorH9e
	eh447WqlXJljrGvx/vhAAvH/TRCd0joUEb5ZlMzjbKGQx0gHOLlKhbcprD6DRlgMLtE1q91cB9O
	y83e2EBkUGhjbnPgb2mOhloxRl7TOwIRIWVrO7LyNCOJ6jnaSOT1MB+ygsMcVH+YaerW18RiVER
	P1f+2mi0oFUehMj9MrBOPYfq4ZbjKwLUMyoEd8oagFCCdlQYWpgpffD0DKhpaTp6MRtLVTcpsXB
	sU07MvGM0Fzt/FhKcUr2XuxRD4v6UJLcijHV/eHGZXXGbPqu6/q+Di52NpUp3zl2wEpaiHaC6YA
	U1C1SUdvisOCtEO7R/MEiF4UpZlmMOpRjQVU0wodDUnMnuUA==
X-Received: by 2002:a05:6102:3749:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ff0610cd27mr7976927137.25.1780943768599;
        Mon, 08 Jun 2026 11:36:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3749:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ff0610cd27mr7976915137.25.1780943768168;
        Mon, 08 Jun 2026 11:36:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66e37sm51078631fa.5.2026.06.08.11.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:36:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:36:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
Message-ID: <a5crn75rxxqtf26ke6552b27ar4xrglkrwdgw2sfnkuli53ymd@2gapkkkcx4o4>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3NCBTYWx0ZWRfXzR4febqnyE1z
 EYqiE4gTzpqjhtBgZzZckuTziy5vkOpAPiv6qlzIS+v6Mdxw7l2ghZLSMAoWNAhm8Fqjau4xqrU
 dkHyuQ9JFcynKFXmSImPzVH9W4X2dMczHZE5vq9jrKvFQokYIeDiCUDO/+8k7Aj4/0ju7qYyT3k
 pEj1R/pCLKMnSSZwIj9H2RWAeOViJ5jD9XLVwc/TJ7xXjBV0+vhLnDWk0xEGmVffHBLHtTEN5ky
 2b4v8X7AQGkLFs3g8td0oH+0CkYBQvEgzsLJJvE+jKgx61CosGuEQj0pqFQxPwIJd9DmK4LjxdK
 tAuWg0G8mLiMqLOmNLN5j3mkUXnMHy5jUYt40oOgybGFn5yoJqvaGSTjypw+6J0CN51miQOwNtk
 Vt0/2tWXcPJ52CjvoqnvpBHaUDy1A9ScztHAHgaQrU9usyK5FGkC/IZV3yKqjrzUtlymm4iV3W+
 5GzoMEOybGLTQs4HVug==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a270b99 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=G-4fGFNKO6kq0i09DNwA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: c2JZ-p7QsPGOqh5DNl3E1z-YwmIAm1fE
X-Proofpoint-GUID: c2JZ-p7QsPGOqh5DNl3E1z-YwmIAm1fE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080174

On Mon, Jun 08, 2026 at 05:51:51PM +0530, Imran Shaik wrote:
> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
> SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
