Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D4C3DFC95
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389208; cv=none; b=AdeCpA9Lods0cR4ktxACD+m7IWryHznW1kicUS5EyBJOc3fr68DaF/sRryQDAfcCzBot9BpjIBjR2/XVQyEAN426fcJ98QtbPbtLk0BM9ETAEDK6yLoftsx9HEf2zUzVerUsy6ojIlp4pdf1nnP6uabnenzlDglxK9JRBusrios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389208; c=relaxed/simple;
	bh=ikVP8vyVJy8q6fBp6aoS9ZFZaajQoxpHQdjadgsnrgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJg4IyH856nWACLAXDKNUZZfqv5e35CU9P3f+M1n98dwJrgwHELKzFED48YwErSBWleofwInSLbsmd6BhaGq/RtSzfBZyA5wmySPHO845VZYCKL8xKl9bE9MzQt+DVZehJnKWwjSLAwevsBqSfGyEaXkJmE6V4SiuuR8f4nuX0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9EcgqNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OU02l2rM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9EcgqNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OU02l2rM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jsP61919006
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTU92ax5OaGynEXW83VzPxNT70Dj4b/PTr8K6Ctdt/U=; b=S9EcgqNlL4I1yw8k
	L/EsxUvuLHxWNomRvVrXQxH1+seSzh7Xnuik7HahKmxxPQVMVIU8rOcPi3Kj/q+7
	hbJyYYrhedFmexKnkW7I/BLEuRPaUaZZ2gOx+pqFVacXitOHgReXCf8OA5xukXWp
	s/cPeuIpcsiK4o4e7hGewcEzUludznu9OpyJN8Ly20wPCUU6G2ghIDFLU48nq0SV
	J/pTzdNbYJOjqHhOLrowkm7PsIPu8gJDHM2hLotoUeeYZLM5Ue4mwxXiacflt+HL
	+6YqNNK7bN9KRrG/2g6ji+iwabVHtrMN6YA/snbm+6yimJS6q+6e+S7FEXbp7zLu
	oJ9lag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueua321-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 12:06:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9156dc90fdaso40843485a.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 05:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782389202; x=1782994002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTU92ax5OaGynEXW83VzPxNT70Dj4b/PTr8K6Ctdt/U=;
        b=OU02l2rM16WwIzXY5Jzwmq+6aI011DY7YORZrPEV2/0HfVmFQLXtzukvEwPYY/UOBk
         xnIXCrDE7WEHHkb9MMpiXTCdb8XpvtCfvpTXBmdidlOEcbbEdbMyEycGsZHxrS7vjV3Q
         C1zOZNXsGbjZXf1Ot4BP1Ztp6L1+j+442u5xQSzq1/7sIAD8sVGX0Yvw2ougAfZFdRoG
         EYHp8QJk7hVf7BFHoa81buZHWZDbF/uM7rPM/QNF/8vCo+nPeOzni2Atviim70LjYJiZ
         PhMGn326XIT31JUtrFiQ4TW/2Dj7W9phzmmEE2HvcmT1a0A9RwBH+jJyS116qCzrM/a7
         MbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782389202; x=1782994002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTU92ax5OaGynEXW83VzPxNT70Dj4b/PTr8K6Ctdt/U=;
        b=EEua7GKBFleJwxHXja4+nsNbSEmFKJMLaBb2XcKxUAZppbG9aibHEdFa6EBhb8B25V
         5YS0swmN0LF0jKUntQHEV+6lqzybFHD62zgPi8ev/6dAN+p+XovCUg3dLsHScQ1LrJbc
         agPO0oJO82MzMk7itiKiWeT7xTKBg68u2ut/BlEhF/UJMt6g6FyQ3ZcF3wi2YLuuvDxp
         LpgKFZpZ+6SA+oRQw5hxMgMavT2qmQPe0cY/u5okHpEOBp8YOLgAi3lJ3xP6+Q29FsaH
         8Q/wangVH0XB19P21JRifbLdAmFzsryf7J3uDMS1UQw4J31OsmFKwuDStjo8gz35N/cO
         Ds+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+vtlMl3KOVmVMGb8i6W+Jwfc/Spe8w4FpnunGfSlpOQz7vyN/YcsGo6mnfsociAw2qY3Pg890um8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLJkJ2EK+N6I/uGoyaYbpyyoajLqnUoRaS7UK3+8D7hCk5/bHN
	Ebp1ijhpRYtAgKD1psqdTB4kCa64z+yxxQU1UcayMWVQUhTyTfDqxwVnmF5OHDD5O+7cpBOnEVN
	cgDJ8M1iQnvWziIPASRwnR5+l0EKPwe1UgaY0OeOE5bjstR44FnSiIoW33eNMrg4=
X-Gm-Gg: AfdE7cmL2Fqi3lYzeLB/qHhkg3Wi7rki1mc8HKG1svRD4BIEP+V2D4ADfU2eVXwWO5o
	JL6cNhyeV/UKAAMyvh7r8kTojX5sFKbHDu1qQlO237e3NMSQ4+mhZL8hCRUAGR9mqpSWauL0rID
	tMVkVn2kTav921AvNbBnFzwcidbj5E6JPBxbfMXh941sy+7BipyLqeHt/TzevSErrx+nyJiz5Uy
	wBfbatql53uUEx8GZuJRRkTwTYaDWtyElglKQzHaOrSRUjtb25mQoEJo+2ghCQHRbaCItHVV1In
	XpKlREFXxyWBPvymwMhvcgtw5xXHYSEZgOJw1Zay86zXlGX8gsaGJi6XG1LS4Ln8Nf5Sn9Q+ANS
	lqB2JqnUbq5vr2GtN7yRdza8nrXMSdGd2Zvc=
X-Received: by 2002:a05:620a:44d3:b0:920:6579:bee8 with SMTP id af79cd13be357-9293b18b593mr195791385a.1.1782389202322;
        Thu, 25 Jun 2026 05:06:42 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:920:6579:bee8 with SMTP id af79cd13be357-9293b18b593mr195788285a.1.1782389201939;
        Thu, 25 Jun 2026 05:06:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbec37dfsm168492166b.56.2026.06.25.05.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 05:06:40 -0700 (PDT)
Message-ID: <4c8d6b13-6cab-4731-b3af-bb83de9d159f@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:06:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uOP-nWhIFStj5uqr_K6MOi9YRUp5Y5hs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfXxmt5LUA3QbKY
 FHn6jIzMWV1p9uTsu9ZXkCrHAvwWfuk3rtW20Sb5OTN0A7TQxSajiWI+uuSo2igSN4uv5v8HwhU
 n5DvftgnmrrW93MCGSq+Ks90Ve44J7I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfX84hoL4d9pIo+
 F01qm50ofFU8YMHQqH+dyDdopqow244eVB16czoQ66c/a1ZkZSkdejfbLGb/7AZDwFGJS9c9WOB
 fpHI8Wmc5ZCPOeZmSnhvep0zqb/GyWXHlVcVV97pEo2ATVpRBfXcKBv04JAg2E+y2UUSA/OGCav
 ndkzsG0NZfiSwKGP1/nOioo38ngypbjKRwzx/xBstKwJqZayvlTrXiUBmuq1xNp9wEZ6HUSKMUx
 +EEDtA/LRZQMcBNjGtKYuu/M63jtYnifkycAYGO20Et5Iwuzg9MJM+QLYYnvA34KDrqZupvOafw
 eQh3Q7KbHZYm/KFNNUNctFZPjXTKBxaYz4NAfuclzZFPAhSJXw6FsQtaZLTAWIj3kZrGblXdT2N
 BIru9UyUdPbDqPudblYpUzrFXxVFbyylpSNeI5kEs2BAtFoWp27dARxVEQpj1ji9GduvjO2wBFm
 yVsu/B9ltSzTMMVkvxA==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d19d2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PSJN4lgLe9xo7xBllQAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: uOP-nWhIFStj5uqr_K6MOi9YRUp5Y5hs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250103

On 6/23/26 12:54 PM, Taniya Das wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,

This one can probably be removed, both files

I think the rest looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
