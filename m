Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785980;
	b=Mbhn2z2I0RhsrvfmWQNjyoh1IUMleBhPyRx8AegFHlSUWeHh90sNmTLZsGf4GsrwFQrr
	 sgkZGcSJEOWaSiAgfJSS/r7RO/Jn6XN6P9fDzLVGJckTagGxb0q2ENK/4l6AyixLbHYKl
	 MNI4f2ZN2QCWDX+kbG42LyNIHA7zVOQAkzeStiXxtbaZP9AZbSF3ud7QDHzx+kO3oFLln
	 zH6uDLNnruYNUaUoLUS2u1sByR5C3kX9CWIxpWRwvn7KyWPp0zlHGdzEzu8O13nBYJuvO
	 a66Zn0LSbwFi7gG+vRc6XhU2qvOUER/L2VI+ZE1wydRO5at57Z5iI1C/PVOqkTg6EEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
	b=kudagka4cCULQ6ymbb9L3Dn9P9jJfWY7AZ636Ybie8pnrj37TBoP6BbdP+oVIo73jtnf
	 unaEXfhMJgURoqpXpKTIxnSVMQlR4TgJx+yZ4ntdhV8JxcHKwsXEJbxzNVcWUZ8+bbkD2
	 X1ESBtkw2eW+vp8gEYTTGoUQwjPJ1+nVE/DaTHJCZ+f7pY01s99XNOqXnP4NjjnTV7zVo
	 uQchQa2mtlFnIn1t0Av0N2Ljp16eYns1QCQgp0y4BREy9dtcPTD9nL2c25a+nmxTWOZtd
	 FW93s8qtlDwcitaw/HInJx/QPLWEsgntXKvyGsE4qKkN99OcyKCwY2sfLy9TGH2KVdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gTala7n0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fL/GMGNI";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804CA606A32C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804CA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gTala7n0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fL/GMGNI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARCh9hr2920818
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=; b=gTala7n01tU2cB5+
	uWdw4rRZjX40s/buTh7RST/DQvNqQZxeIR7KLjvn9b51gNUHMAOJ+5qyMNQf7frF
	POCODruCSV5+xvJDW9IpznqFYKKOPrdGJ4+QOu5rqQejswufFT+jHnzWLMqxEKDh
	oF/7nAVfA7bNXsy11cplSq9kjqD+zLe/mJhGdP26o9RvzF+lVEP+/dQlyTwXqs2+
	B/3UmXCR8mJzpqmvJDZzyVKQhamVnP3auznLs6io1lkIhqYn4qAzhll2khaUorKf
	hqXYa6kN4FiqzL+pui5EV5kur0E+Y6htRxOkea0xaz5UHrK52TzrtI/G/eYkKuA0
	CMDU1g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gh9jy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:26:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9212f132d16so8786736d6.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795785978; x=1796390778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
        b=fL/GMGNIXRzTak0MXqfvh1GykEEbv+J63o3Kf+vl3839bOE0G7z3HTHY24DHEdHSjS
         bAoCG0IMf6M3nkcUViMxSXCf1ucg3SeOmDomdNVcAdTZ5OahW1iP/reVjVV1JEnFtjIi
         UrYBqp8ZlRpIJhKWTXYsl/SyVXhzD5PAGVZXcVBolp/XEU5TAEoLB8Z4ZCtGtvSmA0jr
         6nHYv3J75Ua0TCaVu+t9I+TC2pNvpqjBAtsj5LS4wYXOWsPyskxgCBm/WvXicZsHMB5B
         rRCGz8CklkgG63APYMdzCMMQohlFhhUs0p9VhsrsYkgzSFgKMCIq173Q64HTt0EXEP4t
         piLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785978; x=1796390778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
        b=EyHrTHjyltJFcSPJu/0dggyHSUMlA/518GxJUnMyYSAa0PxPptpmkcGcg6w3TvKiFN
         KOFocJ24s+lAb0FXOZNfv2NhdzY0rBuRxDpbh40XYjIbBxrABrYWsd/da1OQCCTx2Uix
         5rM/ujZsHGEWr+qL29qeyA9SPxWgY5vHSD8TfCjshGwZXv9yZJ+jVMxhT5bbrKfW3y/P
         YPrbKH1SzkmXgv7kNJOGvH6psj0c9IdLwzMAziub/jdA8lyEC0FWR5XJKFP8KoT+ycf1
         wz6Ak/Zf/WP4/S8zxkT1FvQeaQXZyDtIb9Y3uoQDK5eWxvMtypHNn92Q+5SfXATOJTUf
         RYrA==
X-Forwarded-Encrypted: i=1; AL+hErEENdaYdUa7wRqObZ+wod7eFfskfOIwdbsOi1AHlXiAcqCsmwemvvBo9665zmQXvjIeY7pYcXpUECA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pjfRgDjfT7ZW3wZ86LeEToqloGGWAuZCNLnaHpD5D5N7lObkF
	OVZY7V71DhpQwxabPvsAYWJXZgO6SLmZ1GBXRVGdknOq7rNBEUMeZR0i4Rmn6jYZSPCMCRR+JiT
	GFArMHdCtMxzfNHqE5hT92ntFPaTJSH9BpfBLrRFxhkhsqWWQNOco9Wxf8ngWnnU=
X-Gm-Gg: AZFdTZfMY0gSAP30DlrRqz4EXTUN1URDJMWJ4QfuUPLz76d7ILnOHVQRw7bnxLSk8RM
	72jpIH0SHT6dIdbrwo+Wk/tYRMNJNM1SI1MvbpwH6PUxm3D78IXiY4gbOUKMrJbUxBUeveonHxD
	fmdIuM9E7KCKeJedYn9o1zTQbJ3Uzxlk00H03hCNkbWbtCrY01MHnFK1eCSKAXpzgE2dgLlD9L+
	jPIE/THb/8FoDUlAYamAGoL0ovu9wqRkqLbFTWQeh4Ctpdv1rub0MNqXahJWkbTg2bOfQ78AlQx
	uc0T1xqHTWx10C2C4ZU92EV/ZXe4QRUZbER7QTbRqCM3ti7XU+1ZysiznFOAos/02qfjo4K0/gr
	hbuZy1VZaCC2bHnJeJ91FXjzfmPYJEMw68AtqLj+s+cvUJwCm+j3uwd+M2qjLTzDGQNZMXeM=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4555766485a.5.1795785977665;
        Fri, 27 Nov 2026 05:26:17 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4555760785a.5.1795785977172;
        Fri, 27 Nov 2026 05:26:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm856186866b.51.2026.11.27.05.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:26:16 -0800 (PST)
Message-ID: <1bd90d60-8f5c-492c-8d82-71a1de995a9b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:26:14 +0100
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
Subject: Re: [PATCH 6/6] clk: qcom: rpmh: add RPMh clocks for Seca
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
 <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX5x+aErQ+ZswA
 m+WH7Iyxm7oOH+m3lBm5Xt8RzCO8tZHklaoz4jT78znnGz0jLoh4Laufdxfxi8xacgjwluUZFRf
 mQwDkkE5nUn+Pgkbgw0zyf4B/ZrL+U4=
X-Proofpoint-GUID: fn9WovKlsTvAgWF6VYTUazWHGdxapfUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfXwZF08iWXi4gc
 1v7C7eE+8nSA9Fb2zC1kXJqBLO/F/mIVesZW4DDoxveLGZsd5GSkFqKs5mgRe0KQu9gvu5clgp/
 QOqNRVmJ1nOJQ5ESzj2BPfPPzIac22ufpw+fGC9pDUKMqgeymstBfqaMGmaGW6rS+8OZ+9b3g18
 3c911gGmFh/XaOHU3Ti3s+mcd3E9EVPywjFc5qTj1cqfXTH40BY6sS2YjuOrRc7VpjqqZgbo4C5
 bYqF8SPGvJcObuPAmE5/69HcY0CJN1S+JfByOrIKGbSzdcuk6w/Esb2ASVAfm5wofCvHcSLkmzG
 h+Iq9HbeMAMk5KNj6kdGiMViw/zO8NNddW0Hmq1qXJ94eSlD7AUkh2q6B87z3CMG4C8I0rQk6E4
 t1QmCgcSieVqQ1y4C7vezeiVWpd1zKsJZsPP6wSPSS22X7na4GL7xeKKu3/CbyAO4Xmg9yeoz4n
 b7AV0bRdR0huMPA1AVw==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0984fa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0_OSfFgOA50T1ex7QDYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: fn9WovKlsTvAgWF6VYTUazWHGdxapfUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270053

On 11/27/26 12:41 PM, Bartosz Golaszewski wrote:
> Add the RPMh clocks present on the Qualcomm Seca SoC.
> 
> Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
