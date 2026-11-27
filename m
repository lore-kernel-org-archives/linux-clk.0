Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777476;
	b=ZXZede7ijroHVl3MjQvlUOhzNgigqumEKptA9O5HueNidwJKsbk1mYG8tiQM07ErhhJx
	 V3TiMoZlL7FIlKTrmDzfQ5RAiAaJB9BKoDlJojcHiiiQpwLlmPSoOzhAnw0yGtLQIQSHJ
	 j4pAPNEmdjbsFUTCBkC5jxborKKXtzgc1cacQ3h1iT3GOmf/3ABSW0OopjqMDeRDiZpRs
	 G9Tv8UhAQd1aFjcqH3IFfPA9HH/pMEz2Cz4C8d46HJ313Nzm8s1YeYe0zMF7nuSj/MNqW
	 zmF8fmV0CpWUCJ7EmEK1CP4vOJ/vUG+mcpM795DH+g3+NVmewZJ3iTqUmJP506ldhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777476;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DLwTNIf87k72RX52CLbWL0YDjQhOZDpwVgBb/rxmJek=;
	b=v5dpLFioUK2md8tJkgdwamJ51733d87W6o2OM3+DR/Gd5ouZzQ41yFXPpdzHe+ZdNCvB
	 X9Xf0bfCtXnG5aPAZqoBppGdedSzwAFCXIKgJDzoMXXMD7LjbKHLOniyf7C5U5mYzOmyH
	 qRcJ94T7pOtGjSQhXd/C5iindwH92NCg8MA0DU3mYfVQXrIDkRZ/f63l53xasZeklGLj4
	 GacYKH7hC+RauDczwZgNO2ttKyAN74XAY3NWT86/4ds3wqDGJJGreQsPBCdYlDXJTOOPY
	 5nh3bb5RBBe5yhWlwVNNRrsGE5LGq9BGr7CRz42TapK2f5+u9kLgKVc6FU/fjru22Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgMEZ3jT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjjgVIvS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A7606A31F
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B84A7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgMEZ3jT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jjjgVIvS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApDrp2677321
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLwTNIf87k72RX52CLbWL0YDjQhOZDpwVgBb/rxmJek=; b=KgMEZ3jTV7Uvwsfo
	VAHtuaPZlKEnufiObY+9eW18ErDtz2WHcYcwr9Bp3pFv8GBRmcYakMn+eN2qqRsY
	f5cGDAKmYiA8gByXHlKjtcXw7zLASf0zc7DLMjSALxk3U1sXy+28KlcKYi4DGJrn
	5UvuOGzQcKMdplhfLH5FWMBVYgpm0eXZCayTTp5hOVTy3hBmaTC9dnBjXkY1zF1n
	pDbKoRuuhCptQklV74A0gKxlEi/9jSfEj+mzCK68Kjh8W8zqtdlpD/1XSPt8/1l6
	wvoJE+EbIRtkTu9EIzBDXn/xD003PqEU4kO3dcWzTAcV75k5h3wMwJCG0iLXcAdt
	eoJSXA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh93nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:04:34 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b129194aecso173871eaf.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795777474; x=1796382274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLwTNIf87k72RX52CLbWL0YDjQhOZDpwVgBb/rxmJek=;
        b=jjjgVIvSEc4rar8Cr0/gbfzTS78EqvMEIGuw9mU/e7m/tmzRuq6hFzpOYxAz7qJk+X
         7iIhsq2TEWEO+FTEU2P28WgIkQhjoQlWlp/zC6pUluiilOfI73BFnYb+AnB4cDmWHV5Z
         35jeCYuD8Nv5ZuVtruhqNvkEB/UZGAh3SbUTzoxBKsDRAbA+3TLHZivUrYIq2yQGxKk6
         lkev64eoiLLl7ditiLqC7xJuY6AkB+S67j+RhX6F9JX6VgAwVPBVCqC3JS0XckcZ4wdq
         yFXp2btDaleZGFDw4uRxxZW3GLVNKCMAoAjXtBoNXIPJn9x00bemQwD6CGTHF4osQGJL
         o9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777474; x=1796382274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLwTNIf87k72RX52CLbWL0YDjQhOZDpwVgBb/rxmJek=;
        b=xIY2QBMugD38zn+1hsDar7pk+9GTSjoH8ZnlRybXeH4YEX/RqVPh7eVE6JmzLGJnU5
         uG84LaWn7icOEBEpzmPrXM5Hss+dVEqNTVvQmJ9AiL5CwMmFLjmXS6j0lAx0JXOnyWkw
         bi1x9h7dmcti5xl/Ezm49cbtArIFjWMGwlBVAXnF99Bz8l8gz40ZRekdd11ftuxoiy3+
         rCC6nidocW1mY/XcO+W9h3GK1eT/KgY9gOWWqAQSOsN999j4nbGJNRG7t6vNupAPIsnK
         SslKgLRGNwGSDzWixIhgBN6dElQ7x3eUnzu83wzq1MNfY397+D9HUpHN41CATP/IOf5U
         YYpg==
X-Forwarded-Encrypted: i=1; AL+hErExILmjbVD0hjwZVvAU7JW1eoFubRj9jvGDS1mdUMWBkyhH7Tz6bstQYS74c7/9D6U2/Yg9Pf5e+RI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cjzC4QamBq0tS+JTkaSdwLRD+nD5MMcm+CW5Qp+DneaGinKJ/
	zIOREvkzNIg0klXBA3fByqTZHmlBHXSiOABiYFH991UEG1D5NaxhVwdPsXtwln1Uf1eQFN5Kxrc
	ISCpsGVOabXmpGK1eBacuu2NXh9qNEPWoKJoHoWhJ7/Y2GpPVxtqfmbFFfGLUmxyFhK3WnH0=
X-Gm-Gg: AZFdTZcH6V1UhbF+385QBMCmY9fhv6Km7Pdo6AfPv3kUeA9LEblCTxCwyx2+RaAF22y
	Ki/3gPTbMWtDb+UDxt7TDSm3Gxexat47Uf1DPNaIzhfeLTBMnon/rouJS89hvAjS//+ocA1YjGK
	uHJ+vFTvJKbkz6vvvM7l86zAsrnVurDNnr4zSQwNGpMBHA6U75xcP++RV1K88OTZbSF7+02DMUX
	9iT3KRETvlX8o+lgowIEmYAePZ8uV5yr7AcPRaJiSzo2RP8yak4s4ViTwE0R8FxYo+Wr2yMCMD7
	RYjH7zUm3abUC9hT5dDMLG6kckhbWd7i5963Sq9X3EeTQMDs6vqS/924ZtK1I00Vzezp2EuLJJO
	NFNNvDFTnwdV1QugknPi0pSzE/xdiUxsy8bn4NQEfAJZZkobh9ZS+ppOgUiPzV/EZubTeKiM=
X-Received: by 2002:a05:6820:338c:10b0:71a:fa12:4994 with SMTP id 006d021491bc7-71b3938b8camr23273022eaf.2.1795777473911;
        Fri, 27 Nov 2026 03:04:33 -0800 (PST)
X-Received: by 2002:a05:6820:338c:10b0:71a:fa12:4994 with SMTP id 006d021491bc7-71b3938b8camr23272973eaf.2.1795777473432;
        Fri, 27 Nov 2026 03:04:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm11206250a12.20.2026.11.27.03.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:04:32 -0800 (PST)
Message-ID: <67b17c55-e87c-464d-8c1d-fb015041be2f@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:04:30 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even
 post divider table
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Melody Olvera
 <melody.olvera@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
 <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX4HDcbkENM7Wz
 t6IJ/tLB1LdDod3xAdUsEXN4uO6fYyZXtbh/skDdYpYbZAebEk80zEpL/6h7gSw26Msa0/m9+bd
 sV1S0a2qT/9FSFgkpFCpTzSHRfloIVI=
X-Proofpoint-GUID: mgAWJT7GDy25pTClpREH7AAl9MMR1kix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfXxkvrQwDtR8CQ
 iPz0aopkJ7O9eCrNyMs3Gbcmo5mBR+GytpYbI5bj65bRqEkH90A7rsaIsbY/L0u1mQn+lYijYNS
 TpL8Jp3o30MojL5+yyuuXWQZ2jDNeoBV/jCLk8A3la70AYqya88IAkE+rvRMvCA1fmd53sef1Dt
 6My5PgoI2D7SFsm5v4EfuAXYob4KozVOLsQdZrMlLwqFJLc5HBRay5+6FiD0REOKBKNV9FJ3b5n
 dZUyDbi6VYeTQdBhMmNXJC6AvQVfW+b4K3KkqhBBx7xmJufCTqSPMY16UJL6ARopF9XqHjqj1u+
 PFNbLosw+nxG9tdLTvlrDWDQZeJpMk+OY7XkWdN+eT2/HkbauL36/5Y5mQK2NbVr4qeTa+K9T6t
 fgRmQibW5GmU9BG+/zD10FXEL6KB/65UjPf5r1zlq53KwM1eHh0Lpsgb7MpEKcC56N8bNbMHFsQ
 GFxo1caN50QJxdq6QZw==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0963c2 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=FLX4PCj0tlj7fvTIcSwA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: mgAWJT7GDy25pTClpREH7AAl9MMR1kix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270043

On 11/25/26 10:34 PM, Vladimir Zapolskiy wrote:
> The GPLL0 even output post divider table is not terminated by an empty
> entry, the table is passed to divider_determine_rate(), and the generic
> clock divider helpers iterate over a table until they find an entry with
> a zero divider, thus they may read past the end of the array.

But there's a .num_post_div?

Konrad
