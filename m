Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D712C327E
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709756; cv=none; b=omFMfbjKO2Q7WVGnD00Bv1ZquBg8Sr8KmI/XxttmYodLj8j6CtVvDIlX0O8Y8KLVDnH7+Gc5y3DAnjZXecmiZ6B3FTn1LwTi78hukuxskVhr/M3iu9Y9z0Kh/fg3vYfVEx9EofBSxXdNbtIXLuhlImFbeMO1DYkU+x8yqW0//BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709756; c=relaxed/simple;
	bh=/9hL9612Gn0CJSgidmnFRkESRP8UBsfv5LMScs4CM38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vdw1g+vV5PJldJBqJBeI5uLAaLj3619JGOUgdt4Ge1T4/LpQi0jLBcZcKsN51EgDq1cyuCn9SjKacNybAC+pj6X6J5d4iK4CEG9EGBQMHkk76ukVY76dfhI+c4dSzaGlDC+lFg9X/8FgBMGGNHVSj8SPtb4m1flVBymBL6Wz1fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDs3QR4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDs3QR4+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iKw8025158
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zjk1j5ULWEzsfJ1pudMsCTDGZ9oTBcQfVxDwzmzjuXI=; b=lDs3QR4+DKETWGb+
	Qf5XIKiPb7zV6rCF4dM9vt4xj8iNGH7wINBX+P/09KvG1bm124czm9571qRlr9Ih
	ueZfE6/WbZE1ldWRvafRBpExP1cTZSwlIJHsH8F9g60JsTUZqQhj2B69EC2JDcho
	He1T5vH4dpfxZ2pxE6s9KJPjvpXkP6SGGCYuNs0oL6JEvouD9nNy9UK3jZsz+6zT
	d2HPJGI18CVTFAofx3b+5R3iRza3HGK90RGM7kbV7iqMQDNIm7O38mZo43pS3il4
	0ps2uaawxqUT/4uYIXlEp2carI+LTFCaZUXkOHCnL04PzQy652nzhYoi8eRUx8Jo
	0C8+Cw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv13y17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 10:29:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-850dfe24644so68820785a.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 03:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709749; x=1759314549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zjk1j5ULWEzsfJ1pudMsCTDGZ9oTBcQfVxDwzmzjuXI=;
        b=JVcsDRkyCqGEktC+HIwRN/B9xvXiEoq8TJx2LPyoZ9MYq1an1DL74/bwR3yQbdUmR7
         tO6+t75q+sw3hZbQn3F1Ys8BZBoS0IMALQIWJje+FU9U8DvIUy7G2Lx5WhVq7Sp7YNC9
         +ZprrLxlFJll32+IT7mmpyfWlaaQ8ahhq42Z2NJIVmqtL7TayfiBEZ1zJQj9X09EDsp5
         2Jdriyblz8IsqFRwMV2zOrXc/xK1JK9jDkpxCEYXxS0ASQOzChy4Fy5pNQq8Wxv4mT0h
         wQjnHn91YxkYU+8e9m8QfnaI4O5j8XWuzGCibrR5LQKUEzNwcbXtIQq0i3u2TM5gcjWt
         1Csg==
X-Forwarded-Encrypted: i=1; AJvYcCXgk7yaOEdnB6vv3fSr+6GWVaAjDMBPNJgKnBPffyQTT9nlLN/IYarG0FNVIbmHOVgp9ch1SfQgWSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJH84z7VLJ9+URbK5XxDqVRlgz6InQcp9RYTWj89/bqWSUhUr
	uIFnGsCzAlU/6/DEXXMJLUrcNzxZnHOU9TkxYHwRKKr0dHew6cu6+tMLMlX2NOdST+CvcQfwNtA
	qhsWlwxBfPTKVRn7/Yp0v8w/vRG+nM1Rq+oFiOEU1A6WeqQx+G6pu0okRMa/t49U=
X-Gm-Gg: ASbGncsJrfFeK+Tl3q9dY77ae+JA8s+lmVd4YbS8bJ2VH7dvrdElLjakHKThlkv74PC
	gqPtuG2nfxhhnpn0FezUUyKUyvtDF/rG6B/qvM+1mv93ccW+UmKyFwsBpfPDOQ0i6DVU12BlCus
	r6xy5NC9n8zEXiAYdrlEVMRNuUyQ8C4+Bn1DC1+mdHTTziTY9xDeqnrk0LjIrnSbgiK8nq7a3zd
	PzHDrXXlwxE3rfx+6W0G+WtOW0FzehOSfBSlHq+FyCI5wYKHaeiO6cTyrnJgzLruXTZDpZytDNE
	m7U5fBCk27w4F92W1oirLOZygXFo1gauLAekl1k0ehENrpIJpxXsc8c33AjBisJ9VrX24iXBJfo
	55N18HOBTVtLckv6PpNzCBg==
X-Received: by 2002:a05:620a:9444:b0:851:b083:37e9 with SMTP id af79cd13be357-851b0833b27mr305214985a.7.1758709749121;
        Wed, 24 Sep 2025 03:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRzIWeKgyhxXr/t44Dh/z5B9dbWTC8JKuLuTfE3DKhzEiNCFnlBYfyCkI4J25I5SqB0lq0GQ==
X-Received: by 2002:a05:620a:9444:b0:851:b083:37e9 with SMTP id af79cd13be357-851b0833b27mr305212485a.7.1758709748562;
        Wed, 24 Sep 2025 03:29:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b290caba5a6sm935424766b.65.2025.09.24.03.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:29:08 -0700 (PDT)
Message-ID: <9edd7057-8330-4d1a-97c6-e9bf05dbb722@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 12:29:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC
 resets
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
 <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WCewq6RAnFM90PMfc1hot1ZcKMh4SSFZ
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d3c7f6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXwPuxD/wzCK5o
 6QrfUQguOj9AMQ3aKdghjNfVJfU6k8WZkOPNztELy8Ynt0jHrS8Ht+BkA5X2vtdh5BssAC+PK7j
 8V3T1CZYH/cpZn3S4siFfeJ+G30R4q/nCg+unz9c/7FhfynSAVO+NAScTXSGtRSOCwvgIMiUdn9
 Zt/j8z1UN2ZYoxdGS7SoyYE3L/bNKMwLIWddTfrLj8kxOEPhWjCpklwRHrb+qZ0x5WQbnJE/iaa
 SvslE2r2UF1Dz4MlBDmlsp5QKy4yra6918jeG2/5F9vuR7QHtd2t0YWTlEbGHJJr+AUjOvGDk/7
 l44WEN5Rz0yRv28JbxTl/C/Pu7Ys65LNVm71KAGGYrqPxVQnrtU2ahBJp3jTnM9Cl+P+oaGbsf6
 HXKHTFvE
X-Proofpoint-ORIG-GUID: WCewq6RAnFM90PMfc1hot1ZcKMh4SSFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On 9/19/25 11:57 AM, Luca Weiss wrote:
> Add the offsets for two resets inside the dispcc on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
