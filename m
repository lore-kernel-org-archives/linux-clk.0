Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128A42D0603
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809420; cv=none; b=SumzWLsnLEFr0UrOIc+ZfnArIpP5xXtW6sPg+Qem53lvx8PAb8zPrEfhrILIpIZvql9iG5CgQPLkanttvNmk9TKovfXb6N6pkaJLPsRbNBKef81SbW+9YtQCRnCxFgdQXj1kioRLvEg1ua4w1pJjZP1SNfs80hKemspJpL77qcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809420; c=relaxed/simple;
	bh=/B33/5cEi61RV6iNCCfnMgKyJeWb5eLiQ5voWCnDs1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sn7Rw4p+xFR0l2+F9fdGB9lE7PvzYp8/a+4/ZziAgT3lMddg28ElGoVzdCMtg1AYW/RUixctVr3OZsjYzGBe3puDPlhKM7OCuvmVg5T2sOkBId7hItIJBgUb85JsHvLPWKBiaanksOuJq6nlOOmNAElDQo65mjmHMgI/V+43AYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BF3dRRSE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV/NRTxO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BF3dRRSE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV/NRTxO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CHon1090536
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 08:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeTmc0+pnXWw+8RJ1NKnm7U6qJNLJpn7qhQk6NK1F2g=; b=BF3dRRSEuMu/9zjo
	fmMI1e2KxigLztWz4Uyt88uPIlXVvQ9A7uNkhhBMgDRyUWhCp1E58LbfAj2/5Nwt
	CR0CcAdj6Q+46/TlsyvTMRoIerFtRgZ/0oZA7q3yBakcyjUeM79sK/8sQG4gvaCM
	2RbW8/w5LJZzZWFyejegvBEIqVYCtXfqujZA/Rb7K5gPdht61WNZwrYFNOcFBGAv
	1xV4rzdMls0Lkvix4yh0M5+MucdGaTxx/YEfdgOrpm4EFQzdeueYRw7AfqkgFP8V
	kRzjAJc6vWcS/n5lHp24coLRJ6ArrzMxc2J3IcCiyuXf3CS8zN0/XZUREC7c94rR
	WtnRMw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5sb9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 08:50:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-969312a613fso207663241.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 01:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782809417; x=1783414217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeTmc0+pnXWw+8RJ1NKnm7U6qJNLJpn7qhQk6NK1F2g=;
        b=AV/NRTxOHi1G4rNCnTLG/967TPVtx05y3iiVyKv6qYeLZI44t1SM7PY3fo0+DqKASR
         Zlc+w6SH8tI88vaxLSSZS1zK2GYm+5j0tocxN27kSs5N+Wpwobn9PEh96KFlNCkfmLBx
         OfUl0nSWWlt93IndNqncfSCCFhzQWeuwa3mKpArL3HFJt2n3uZgw3Yk/HJNZP2gIFgu5
         bC55cOs6KiuZMiiNVuU3kCxdusmJYY8vKBZV279IiJB+9EIDWN9bljpWXyreXYiA4dAg
         Xk58eUOZmTGpO7iko0R0BndGQWcc0X9tu2vjrjbUE+z+8DeNhSyVEJM5n7cbmabiZsmO
         yuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782809417; x=1783414217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VeTmc0+pnXWw+8RJ1NKnm7U6qJNLJpn7qhQk6NK1F2g=;
        b=TPYem863oVdX2gWkRiB5vAD40ueNTY9Oy5vxZ0sY3pLk+8UHV3tzQMjEMFD7v6LkY6
         dOVxMIw1OLTnsGqf1NOtyK77QF13c3B4aR3ZCh8QH1ZWbpMnqIq71ZMWLamKmcgSR5We
         RPxXMdAr4TVcwE9ZbgZcIwGn8ec5OnY/W7ncdUn6lCxiReE0u9eLaKPvyISC85khwc0Z
         soPiJq/4gcrSyhON/GNdYEluAlMcrIfDh1q86SPabLRa4nK1xPY23PwEKbHHOvQGdhv8
         PoKLSpJ0eoHu2CBqtZQ0byQpGYvOgpM0D1qwcRJxbl9aJIVbVyBQzDwoxTall4CCqbyD
         4juw==
X-Forwarded-Encrypted: i=1; AHgh+RrWv/3x80NOG5dOg7pUGsRPJZWIA7asmrYYUUhl+zJfMm/iIkyKP0WeHuCfsRahR/G3RnLuVktbvZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCq6I03dYAGWlqMN6RmCGnNNJ2QCkUgfh45OxLat9ff/pjM/S5
	Ni/odegU5h4OgQ5svhhj+Ackz4BPV5nzr1R5Bk1Aj1VfqeuGU4uLIzaRnR4U3Z2k1kztaNAaKCy
	2Ziqf9CB+A6hk3zIcjJaWYwCn5Wi8KNwJcke19Crxk3Z1/0N13lX48nJiFI9irXk=
X-Gm-Gg: AfdE7cnqlg87y9giYQg1ARhQElaWJN2DUx+u6OkH9n8tpwRyRQUcaPzSEXWpwLX+5O0
	XgZoyBzpeqSYhGpaHBRG7K/HjoevojfVbEuDqtCBVEk05qw4gsOmKvRRQ/pWv5uyOg3k01tbXUx
	FDdaG1vsdPi/HqC9xrdTqrkc60toFy8C+AcjfmfF/+WZ/8qenrpIwcjSEWGisgES0ety7QcJZIq
	HTVo03ViOz2MSc8wDHl+D15YV7IzhHf4wmrYFW34BJTo2oF+GrT8R/+Ad5Kk4yu6RAgn7VgRg/n
	vMNNsCehyHxdbKYINcSmGekG2o5gu3xfkIyzUqgHeSN2eBzCK45BLVUzsb5AJWo75bTYud0LxUq
	XeeORuBvv3VcNfntp/HyBS5hJPo8kwcllfuI=
X-Received: by 2002:a05:6102:290a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-73a365ea4cbmr491471137.2.1782809417313;
        Tue, 30 Jun 2026 01:50:17 -0700 (PDT)
X-Received: by 2002:a05:6102:290a:b0:738:b13a:c810 with SMTP id ada2fe7eead31-73a365ea4cbmr491468137.2.1782809416938;
        Tue, 30 Jun 2026 01:50:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c93cacasm788437a12.18.2026.06.30.01.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 01:50:16 -0700 (PDT)
Message-ID: <39032914-3a66-43d9-885f-55f5d60da047@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 10:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Return expected ENOMEM error on dynamic
 allocation failure
To: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Dan Carpenter <error27@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260629162127.3910603-1-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629162127.3910603-1-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a438349 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eQ2hbtzqWvYFnmOUgewA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: XEZ55Euv6ExqzvJKB0OXZm4_7j8pqEew
X-Proofpoint-ORIG-GUID: XEZ55Euv6ExqzvJKB0OXZm4_7j8pqEew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA3OCBTYWx0ZWRfXztoDeIFxftf2
 rktH3BE5CeX/BOWFFbsn/GZa0RGQSj9tk2nZNJBQu72aQiL0sGWFGgoy84Cy4OR1lT57sku7G7r
 2js5rNl4rpou0BN1YkdRIrPH3AqAXc9kn0Ah6qQWHzH1KRQsMRsxA9w9NHtRnoIrUlD1Z9wZTCQ
 Zf+E5WA/lrggqJlYenKNEZe2OTwaxtGR/wQ3tpT+AwEyfdzCa8heuazwHymp2rW+O96rL7B37dl
 +Ee4c8EqRy5VxDverU5wvQOc0KBE0ookPjJfAvejX4QONnCw96ZpaJNVSEByUvTfBgIh7doxWFF
 nXhRSZdi8g3G2+yG3Zs39Uc0Soe73QBuPAfxWVo6CiWcCMGRDOVeSZscVBYUWZFJsL8k5vHAEAi
 NNMcSKbJ8xa0WpAbuVrVBj6wx4wVXuZnNNysMUF0NHWyVY2bdNSgVl8IHVLsUVFHmonKcuV4AhW
 MhSZ2lKvj8BMYfzBd1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA3OCBTYWx0ZWRfXw5RJPjH8Fy0+
 uxl6PR2xMjE18YlKI2iS0TCM24GyNY4cDlQDDvMLl1cfkjEQUV38WTKd7QreXEj+WtW+2WaJ2Hd
 dcmk0G+Su3OVX9qoc8ju3jVUiwMGJXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300078

On 6/29/26 6:21 PM, Vladimir Zapolskiy wrote:
> If a dynamic memory allocation fails, the returned error code in clock
> controller driver probe functions on a few legacy platforms should be
> set to -ENOMEM instead of -EINVAL.
> 
> Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Hm, I'dve assumed that static checkers would be able to find this pattern

+Dan do you still work on smatch nowadays? It doesn't seem to
catch this one, but I think it'd be valuable to look for this pattern
- AFAICS it only flags returning -1 instead of -ENOMEM but I can't
seem to trigger it with a manual edit to this file and the following
args:

-p=kernel --pedantic --two-passes --assume-loops


For the patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  drivers/clk/qcom/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index eec369d2173b..0e8f380873af 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -169,7 +169,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
>  	if (!node) {
>  		fixed = devm_kzalloc(dev, sizeof(*fixed), GFP_KERNEL);
>  		if (!fixed)
> -			return -EINVAL;
> +			return -ENOMEM;
>  
>  		fixed->fixed_rate = rate;
>  		fixed->hw.init = &init_data;
> @@ -186,7 +186,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
>  	if (add_factor) {
>  		factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
>  		if (!factor)
> -			return -EINVAL;
> +			return -ENOMEM;
>  
>  		factor->mult = factor->div = 1;
>  		factor->hw.init = &init_data;
