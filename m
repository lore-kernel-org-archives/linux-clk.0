Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE303033F1
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320129; cv=none; b=R9t9D0SvS7Eumwong0LVxfxj99rR5CUtIblWzYJX0HkpBrqtm2NWQZgohB8CVjl72Vag0Z7jQGwmxed9v1CZbPhwUK5uyaVUVqm90R4w4urr4eFdxbIq1HleXS9E/2AQqKv0mBu+ExkBMbWeZ+DxPMpPBWMdXQHvdrhvHpmZpUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320129; c=relaxed/simple;
	bh=m4ggI6ejvTcz3a8YsVqjQPSeAbVZ6LlBtCqDVqfMan0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4LPaYvbKqwJ81bj6Tei+ZymVEp5ye9+S8vpokmjZ8qkIIzacnetsBUI46iXvJJc+and/nwLfYlKIi0npWF9jxckFi+GuzXOtG8CO3K9kTPtCQ1cE4u1VRuxRqqKdvW1PX+xjFbMMNFjkmg6Hcdc436lC+7flJB05NTyDCZ3+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHjWYrsj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/wYx8F9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHjWYrsj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/wYx8F9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7fCm1613301
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbTHh7EdEQyEkS05BjvvhDDmfqCeoqVKmCXCG7opN3I=; b=PHjWYrsjbGeqBGmW
	4jedSJXEO0ePXFGHWbhutdImKiD2fjYgjC9gcR005ypcYR828Qz75DueP2LNeQqM
	qiDbr/Kpi6et782Ggl4fVPzocmnwzmFznawIjxtKqZAXDX1SfiyNy08/xoxQ6YWR
	0Mm9s8HxplTwvHwywqyhZBL8L1J+fOtSoDY5f1VqXtgK4K56LSabpNPe8l4V8Y1U
	gSg3Fo0QmR9lVYYH0cpiSBoHufJ93ZG6o9HtNqs3JfUYo4TugLU37s3VmnPraaal
	bIvZS+sq7vYu1Yd0BT3vcMUAvBkvuVIJSwSmJOKNv1XYPn5EnwKlT5p0fIdly340
	lM48mQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662stm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:22:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a633ce06so35064571cf.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 01:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320127; x=1771924927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbTHh7EdEQyEkS05BjvvhDDmfqCeoqVKmCXCG7opN3I=;
        b=c/wYx8F9bKod8RRnN1RLBX/MwNXghaufQccdiGBFGJkGuZknK8kv/Bss0zKpp4th7t
         mz3dncdPLrsQRZX/7u5cX3+fjMzAxDCHxbyqqMAbDlmP/6flvfXHOqr8ALFd6hGXrWlL
         E8WtgSXQNSrwDo2CzQxnhSaU6eyWHh8CKeK+VBRkSKQomKxHd/GqhmntqUBVovrUV3wI
         qhMB+hpPTEl4IPZWT8CJ4PdqkRd3PZXUJfAdJiXkAre2IyZB/Bm47IHZLtVdqOUYYVx+
         unpsp76DDxMFzmgTf+c2H08YJc9IzlVJsYjOQNJSM6TPF6vdhqP2P5xUojvbSnP5ezZV
         0SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320127; x=1771924927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbTHh7EdEQyEkS05BjvvhDDmfqCeoqVKmCXCG7opN3I=;
        b=E3FhDMOurHdb9PSfs4lJjb865PHtLaBfLCxHHiQlt+Nc1wPy4M3aJDgvNOUwKEWOaq
         NDKD4rBfnnGMpDNQooXOs0Khqw2gXXxA/xzzsOsJccrwYJerrVC0jxwpaZzhG514Umqu
         XrdyqSyLVg2Hm27XOnNbnT79tsmtFizfxc9/AGnO+OpWOSvTBZQhI9jrh5tq5Htm7N2L
         BZBCU5TXuRhf+dlZS2IJDWLQHwcpZgbFnzscuGbcjy13/aFuviQFLsrJSKZjbY+MjZNV
         nY6nsOvPrxB7X6UH56gP913RCyvaT7LoFlVbKYj2lqkfpnTrrxhJ8GjVPJgGGw0KQ/Q1
         EEjg==
X-Forwarded-Encrypted: i=1; AJvYcCV8pEnlN71LZUh6Qo9PMoYkVnZnx7ZwBRbFEhH5slgg3jVz9KLbUFKNLBmc/ihcHqSZg9NJwL0W+d4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNARsYyyPOBkcu5Od8PQT9qbEFFmg0W9r83Zll5m2cElcPRS51
	Sww37LbRw9yiKVOZ8bMU5+tKmu5XNvuU3AoWQMV39Tp66Y1W5ZBq9TpVtGzGTy7OyspC4hMds7Y
	OkRazxWIKjnqjsE1KUogPPgqtQgy4Idnr6/MQiiigEjosajLXkerLvPzKwpOEE5Y=
X-Gm-Gg: AZuq6aK6LUChwYKgGSrotafsDEmo1D7GmhoIVJRtBQYk1VqbnWMbNf2oa5J7lVxoJj6
	azZ1rBIq+yJMFVLiVOJyl0CaGmOw/oK3QCFbT3yxeDhxcj7lHquOkRcDH07fFno/26M7zxTomCQ
	7jWpRvXawL+zrS2hI3vkWgPTAup5SnUjpEfK+GIRMQ22HKH2ixaryvO42QLKfuY+BHJuKeBfbaP
	nSjpHVEZ7o3SXbxDZWLT3FHAPFAOlItKi7fVv1HlMcumXH/IOSLwMDVV0KsjYcJlzDTHo7xIPTr
	VesBdtKv7Na06pWO1Y+aafzRwpmn2EYrP/BM7UKjHzaO7VfQCtuzmKzEB9ksravacza9fSnbCgN
	4MeMR+CHhGtDYq/xGWfC5uJHNVJIuQn0SYRUXm1AhbypoiWbdcJ2XmiPvMHF7mQqP9B71lv0DT0
	rW9kc=
X-Received: by 2002:a05:622a:1182:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-506a6b40c62mr138408491cf.11.1771320127229;
        Tue, 17 Feb 2026 01:22:07 -0800 (PST)
X-Received: by 2002:a05:622a:1182:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-506a6b40c62mr138408401cf.11.1771320126776;
        Tue, 17 Feb 2026 01:22:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bfd3sm2346040a12.2.2026.02.17.01.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:22:05 -0800 (PST)
Message-ID: <5cd6ad4e-d494-4dfb-96c8-ae6507edcb57@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:22:04 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: dispcc-sm6115: Add missing MDSS resets
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Adam Skladowski <a39.skl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-5-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216233600.13098-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NyBTYWx0ZWRfX97CkLcVzExAP
 ELHc944rUeuPxw5qkRy9TSsPS2E1AHdvGMZAN4A8AfhejSziBqrbNNJpW+IB0fDqjes4K2wSWpv
 PKFDoaHz7jpN88PCaXo4pQHK7VeJXyDifgzsNp7H5yOK/R5kvF+2QEHpcoyo8tojJDzDr03X+YP
 8QMWcRsQmiyh7Va5n0CUiwUYxLVB7uaap7ngbStE7/rMXC5DSKqMydmMvk5pGrQPTKpgHW0KzMQ
 QyoLUR8zNa6ohgj6UtgcZpe+OH7ixobVv9lIt+NId/yqBJEUABwiC3QN6Yc4C+jkBY/Lh4tikvm
 lq3S8r65d1KEd34UqfaOLXcfS++Uqb4h4ypf+RAv6c5xXJMnqyUO6NmHMZY7n0Z1QHbPhxQCf5K
 4QUnk3fT56FPJ2s+win/aSBv6eVVITRGtto17H8apyyQ0/MbYlqof2VT8BBIOHLFDSeYh1Q44ZL
 XIs9d4QQZtbiVKmUSuw==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=6994333f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=GY9tGbHfO7DmpnXFqVcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: abF3yI9iTcAMxpjQ3YxxMCgcQm6HRu4P
X-Proofpoint-ORIG-GUID: abF3yI9iTcAMxpjQ3YxxMCgcQm6HRu4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170077

On 2/17/26 12:25 AM, Val Packett wrote:
> The MDSS resets were left undescribed, fix that.
> 
> Fixes: 9b518788631c ("clk: qcom: Add display clock controller driver for SM6115")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
