Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F102F3E867D
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522497; cv=none; b=T2ItsK03UyRbm36gQbOBW+0nVyDEBu9gLSH+qUsqeN4HptpcGXINfRa9uWmOqB+f2TD/xPNbSdHy6E63yNMkoZ7s1nCL9q7ot6g1dR43OhWYM0owQc21R85sw5SZA8XtkPJgIsGPwf63Pg3k5SLs1GEKV7TrCtE9uu/U1d/Y0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522497; c=relaxed/simple;
	bh=v3ZRDhp2oZJRs8U2iTSL90RVhKSPq+B8LB8nxAFrsRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRBcQqxuElOhUs19brJ8pxgrhQGCmxQ3vWozPZ5z1gxzdECUEKVot5Wn2igtmB8Ch0FhFTZxAf9MK7qA7dzgN9EGJTb2TvXk+xhbz4PnlJZZfB3s8bJUYCtAw2BL2SBfODv676D7cz19lsTgTtNFLjVnueBeSVeB437+ZbqEqD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npGZEmkH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F29cA1yB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npGZEmkH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F29cA1yB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QArOFS220315
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 10:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zT4sSYysRwxC31eN1VVca81UgtYXFYInUGnR0rZSPM0=; b=npGZEmkHTJNDptts
	mNxhz0eAYUSy3kWtR+t/H1NQhrF7ixVuQ+W7xnw+w9QMivmg2kSdAyn85e2ESpTm
	fCkh6rqtciQ/KaVH13PZcPnZnnQ/ANdk8NTaAFfUUp0jZVchrm4KJqWYURIsc8RG
	j1HxY+QNbo4pg06hhzdD4N8Adl1Uhb9py7y1b+e+QcU8SmaWtkXlAL9EOX4kMX89
	dncgDMpXW24LbjgAt2mCismwnWAUagyR54vpETuUdEFBXE6L3qGsPSXznoD3baqw
	9GmUffXvJ/zIECcSaV8YtX80q18923nvKjtzjtTExihBlxxfW4aFg3bxQM+eqpvn
	dozh6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqg04g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 10:54:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b86b756c4so2880411cf.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774522494; x=1775127294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zT4sSYysRwxC31eN1VVca81UgtYXFYInUGnR0rZSPM0=;
        b=F29cA1yBQUPX0jGvpvA3DBHyEkiv8P+LBOuRvije/SZKxTc0erWRGxfx/1nMKyCGLS
         DNMNrxfBl/n840hnC04eazRkjssrj/fhYA6J0w/xfTOaDLapTPwxlzn/KCQsykCizaPL
         JZ5Xap0ZqWH9VFSEbLQPxbK5Bha8yLHp6mierWScV+6UosO47K0nZm7tKmBUoL1ZPyKC
         vVn5IxcW7dy3gyAiCXLUV+102PFYdB7JUy3sHh0fzI2iewBVhyyWnCIiYT/njrXHVghk
         w1oybsa1GlwnStsJeXQTxrVU5Nf0QRUbFh4e+8QV53tuOM//GQBSgBw+KtCQMLQcUxHQ
         /0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774522494; x=1775127294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zT4sSYysRwxC31eN1VVca81UgtYXFYInUGnR0rZSPM0=;
        b=Cl+5jmBkzATBgRKXufiD0lkkt3MgG4hDuHyM5zHRADVZBtGAEHdGURV6aK/z9y2Pyg
         p8W+rpNhSgsfOfLP2UzovInnc+GxboMh9u2yZQMsaeP6hEwCicT3+aX2DSRA5AtOuEjQ
         /Wrbnc2Uci69PntIM+0oj2XH1brRzYXhB55CVqXctyxvECvxiwCAEFJd8NRJrMQ+Uqgs
         1ilCa/wNQ4RlUVt+fY7A7iBhbZBQOX7mI6vmm4B1QRZxFZg0h7X77RP+m2y5QxmdLmAx
         orctGf0ye1BMLmIlo40Zfoz8qcTrfwd6V6EyoHKPBQKiVHZUlGny/J1ACv7A59+GZXHc
         nAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV76+L8ECSNM3YBllEzxfBHpxqaF/6tg3rl3X0zCT88EYFlvqXPa4ztsJlFm326jWimmNYJlvLp8uI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTDVkcQUlejyj46YUDlPhWc3UDnqey+cL85xUZRyJHrhQS343O
	X04p8dL4n2IV8mVw3bdwwGL4MXLB/dhtCojCsb8rvkSQKHAqFXsTCI5Qn/ORZP9ueRObobhTvkN
	JVDn/aEIYreTXc6ij/7YjMbaHycfRVTuCHRJYFRHRr9ll5MdaUui2jgpua14TwY8=
X-Gm-Gg: ATEYQzxAS9owr7cECsFL/MA5uADc+Gj4gyEbdKPGc3pjyntLkMuWcBb/yYn5gh7PzO/
	ffpiag1VINfG6loMgkPcxscIYIn58CWCl331nbzrQqYGEeGtBkc1FSmwXLRzg8tVkfnQaSGOiu2
	JP1iSLubeskuaMOy15rcKZUM840K9dLMeyg6vU+QjalgC/Y6UclQ3jxtnZc0mCcGKXn31ZV9xTg
	rWzdtAv9gF6ibZSwnwVdxO7DkOUcO4E/0mWDbaFK5GsySB0s0dF0bV7peIYr8f52ATWqJFdELom
	bWqoONNK8tlKcyEGQrU5azhALzZRcdDCtWY+PqKvTthFCoVe435gV6lwJFdMK8Rsh40EifQnpy4
	hidhFd/4jy+9nRXQtBMe3mhBh4uk/8iyInEmS/AkRkNHxxQLikz2nu/U/XanGGppxk21vqq9aW1
	wGafY=
X-Received: by 2002:a05:622a:6681:b0:509:a3c:e390 with SMTP id d75a77b69052e-50b80e75f0dmr48907041cf.4.1774522494352;
        Thu, 26 Mar 2026 03:54:54 -0700 (PDT)
X-Received: by 2002:a05:622a:6681:b0:509:a3c:e390 with SMTP id d75a77b69052e-50b80e75f0dmr48906911cf.4.1774522493899;
        Thu, 26 Mar 2026 03:54:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad67522fesm881241a12.14.2026.03.26.03.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:54:53 -0700 (PDT)
Message-ID: <0b1f733a-dee9-4ac9-99bd-7e18ab403d7e@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:54:49 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NSBTYWx0ZWRfX2KNuCxLz5ms6
 8i4nqfuzGd42mMc7AEo5HQE2+YV/RYu2LCEHMFZwHK6LmLLoYJKu/MujS38lH5zBprjFF+9qEu/
 ksOd6w8beKVHL3wCXpxOC102FESAQYP27HuTtK4B6zxOnLwM+n8y+9peSbgKiLYbP9CvG86vS7A
 UepyHvlBj5YW39PMzHw9OFLccSzk6TMQziwagKfBEt38oNXc7/AJh3cnDPIM2BKJvZSj6aQcslT
 KkZ0oksmiB+lHfrZru4rZij64yXGXGgFqNq4Nu7Q7GcIVTULWmYTZA+Ia/FvbR0abOVDOScNkYC
 oaVki3VM+RyTWdW5FMYa22DfHmc3vCQKraHvGru7tl0QHjXsthA6Xr6qTeFKkePMVvRRcMhxRJc
 g+1cOX1yvOXwfLvF+SCGrbDT6BSPEl95DUy06gahirbiJs23wmNU2V7ucItZtktXmvnWDvui2BJ
 aAI1gu9WVlRKZX/tY7g==
X-Proofpoint-GUID: n8KF98F_oOmgBKGHBuPR5n2kzfMV1Hl-
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c5107f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3mFuQuvshfmmPt20Ni8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: n8KF98F_oOmgBKGHBuPR5n2kzfMV1Hl-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260075

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> SM6125's SMMU uses 36bit VAs, which is a good indicator that we
> should increase (dma-)ranges - and by extension #address- and
>  #size-cells to prevent things from getting lost in translation
> (both literally and figuratively). Do so.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

I think this is correct, the address space is definitely larger than
32b, esp. given the SoC can take 8GiB of RAM.. 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
