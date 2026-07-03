Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168EC3D093C
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080995; cv=none; b=Fd1YweTEJvqsc9NCB/DwjqJBglrQWAtOwogZPUex8xI1mf+os/VN0WxW3ElV28sevJr0oA6yram/sZhhnwf5bPMaBDbxnYOMmhOobHrjAl4xYKjLXanxZlB6e6/D023qqaGP42aotYECNOBka278hguhTGT95VNFYT5mfShevZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080995; c=relaxed/simple;
	bh=6NXu9te8yLzaQZaipfuVaGTwPXyX+RpS3G0mYrIZA/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeI6OjfT8EZjI+O6DFLNBeCViQl67Lgt+GHSw1cMPpld+o10eCbe876ZNd+tXHh9l+B8dmDPbp7Rsj2Z1wCsQLAgwwy4jKwKA3oEc49n0UBuMjdTrPogwux+jBvbQ3ysSg74fVCd6e4uzJf1ZGmss1QUo2Uil7Ujez54ySkpQ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRI0TDj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kppuVW1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRI0TDj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kppuVW1J"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BPH5b3135212
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 12:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fjDEdFYbnZhqyLlsdmQqlceB
	oYHqGDyw6oOJyZWZ4Pk=; b=CRI0TDj3zvPnjTQm4QxcAvlqQesDLNKzC4zFteBr
	Can1T+Dh5WKkvbmHc0Bs9E3KzYHlpnUkjn/fVit8kzOifl9JI7/TurE2msL5ly7n
	2vshCoj4jIKl2oQ2NbPC3C4ODuocS6CZ3H9y3EWNpIUtT4XNONpJ9ItwZnMFADUs
	vADcG2v6l4LvcBImdWBpWKV2BsuoPHwdSmLk6aia/+p9Z9A3rj7zJHgXlGeSFOQ/
	pwBjy1ikBXknhoWbnOe3C1RwQo6AMhhUrkscQXNJBMg5aeewywvS6yr/QlR9w9dO
	lC3VoRh4/iRsJGg6MHdQBXXvVuOzgYx/fBwLeRhsM+xzUg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcj1gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 12:16:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9b71388fbso12730695ad.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783080992; x=1783685792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fjDEdFYbnZhqyLlsdmQqlceBoYHqGDyw6oOJyZWZ4Pk=;
        b=kppuVW1JcHXYvHXF3c9mN5CGiUZhhJRZOPeOrsQ0lgPl7iPrUtXwGYk78vPLFQ6NGG
         eKbc5OrMWjahx0AFeDztRh1qPKqnAtNEx6K7UkBwueLupvZ1X9U5MIagC/fo29H/HfXb
         ndejel/VrVaRAnERlxMq4ZFEeuA6/h6iZth90wBfTELDGvLL/CYLnn/ZxPP/kba1+CTR
         QCuQBYf+Dm7L8rg4kWSOmOTRrWrPV5CSu5kOCuGFWPuu7VKq1AjuHeR0MfKknsIpw9+Z
         KoD59HziFsFh3zj8UgjvL0Y3DRVJyHiq7sSfJ6Vj8PhrLyQrDOx5UVak2+11EB8MswEl
         nYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080992; x=1783685792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjDEdFYbnZhqyLlsdmQqlceBoYHqGDyw6oOJyZWZ4Pk=;
        b=JkX4tg+8IIGtjI5N5B/TmMRoaoOnZAEuvsJ/EwrqJkeG97PqUajJ9v6s+3pQu4T5A6
         6xSnZ2TZaWYBTQKVtuyuwzNGpcBvfI42faaPxNU9v0qPajzTkgzrma8Ehm6pe/Mgpy7s
         aA1tL7qekWtKi929R3iRH681N49NscUBMzpWYUyLTVB4jmqs7Agqb9fTcbjBiv9bm8+M
         eZDRlJBnj78ZV9ceHc66gUCGxe9+AuPpdpMHvFc8pVwzL34xkj0JsCoI24A+Q0ieDxFD
         f5l9E8hIanEJuX13v5tGRXasVnQs4SEBPxxbE3319aQapddtcFq9qDvDl940y8dThwhZ
         tt0A==
X-Forwarded-Encrypted: i=1; AHgh+RqfQTH49DPul664f//0SWn5J5Vis9PTJjoir+/wcXSpfvIxxK7ICXJ2wDhYF8+aG7Irk+OliF1PqeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YysNCT1Mh09fIEHZyHB0kxOcwcHJc2Li1CocgErefvsGDoMEgYz
	rc9+QP2qQlLRa3AdxRQvZ2ghOOOwJ3030bRojvGjptV2cDznSqnV2zSFylybN5tzhmjDnLICnGv
	g/Rrm5S4g55wiU1vvPw+QiVbYzkO/i9MstnfxfaEjyu58n8IxVEJYIxLcIufrkno=
X-Gm-Gg: AfdE7cnLyZ6En+R11aaUWZVpQvKDrzDUQRhglfH+Gh88M+tipzXBNdfCWYo0oRvaVXp
	87uK/Cc/OK5jH8+kDg4mN/DXkWK+6bWdgw57DMNjtZeuBvD4AdGplW82POuRf9d4GyyoNt4bQLo
	72RCeLnPNZVeX1+Wkpmwgd1mUKSYLqcqtUd1u0gxzC9d9ZD08T//fcwapg+Xee504i6BvuK1Qqb
	ZZKswx7GSRp/ckcbOhTXMs4lWM6Ut1+aEj34ACPIpuwHtZn7amgAT6V8deFwTOzqXraixdYAOmr
	wO95wvc2AaowqOpnnxtYUwfoYjE74tDEQjTy17mY2g5g8VZcG8bnvKAxgQ4lGXcLhh1TMtdWWps
	4wmSTJ6vRfKk9ZBVNtiCcG/yEme8kUOFEwWO1o3MhWm4T2MiwitUPcvLcWg==
X-Received: by 2002:a17:903:b85:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2ca7e8ed115mr112319535ad.47.1783080991930;
        Fri, 03 Jul 2026 05:16:31 -0700 (PDT)
X-Received: by 2002:a17:903:b85:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2ca7e8ed115mr112318965ad.47.1783080991366;
        Fri, 03 Jul 2026 05:16:31 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad77651b5sm8942955ad.42.2026.07.03.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:16:30 -0700 (PDT)
Date: Fri, 3 Jul 2026 05:16:28 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Message-ID: <akeoHGv905FTOiy9@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
 <20260703-godlike-artificial-coyote-3e9ba9@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-godlike-artificial-coyote-3e9ba9@quoll>
X-Proofpoint-GUID: Vj1nm39uF2t_-oulFIKthgyTAWm8QrSp
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47a820 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5am2cag36p0NohAFmmoA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Vj1nm39uF2t_-oulFIKthgyTAWm8QrSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExOSBTYWx0ZWRfXy1I6TX2sYt2Z
 15wIUK2VItOoEn7jEghAhWipWWuUpMx1hJqVDa5YyRFqNCqsQcRpSFb2QEGN1FN0FZK19WWf9cn
 JcZJfnNv2f0w5JmQVjzufrSF9mWzftM52dKhvRqNAwlYiESTaLR+F4CfS/SKenhHS5mfJ1AsYFh
 FEZng8S8U55limey7sNbiV8gfLaasPcZaGE0I4g8ACvVIyiPDRAdF8+oGKhYJSUfN3NDlNpoiI+
 UiA0ERAPvmqoGzFns85Vu4GIQcL4chkxUSxTepa8GC/i3CxyqyNqY9NZ9lpkEoHrPz7d2tldw0l
 oWSdWBFt/wJfZPstg7KCxgMZpJmV//IsUGFNsSVII9ke6Y/7gZmN8uNyeBHW2fC8Z28yOTRM/OM
 pFaBB9L5Xs2oQIsYXoOH/7DFmWdNE7vCLVNIZq9+VZ3OTuw/lXJAovOdtmd2jsIXLRBowUuxBvF
 wUF5eXJ2BZqdeiwcrIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExOSBTYWx0ZWRfXwqztDIZSWscT
 HfQxwsXgHThxvdDwesFEgVVXrzFkSVQI9yaHx3AFrJImq5D2mtYuNOHGIQ/w2mVbNq56lW09nRc
 HSxFyvBdclViCKkKP3gTqJh2mXnGbzA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030119

On Fri, Jul 03, 2026 at 07:58:00AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 12:36:11AM -0700, Qiang Yu wrote:
> > The QREF block supplies reference clocks to PCIe PHYs and requires
> > dedicated LDO supplies to operate. The digital control interface for QREF
> > (clkref_en registers) resides in TCSR on glymur. Since QREF has no
> > dedicated DT node of its own, these supply properties are placed in the
> > TCSR node which acts as the control interface for QREF.
> > 
> > Add a dedicated binding file for qcom,glymur-tcsr and document the supply
> > properties. As this binding will grow to cover more SoCs, mark the
> > required supplies per compatible using an allOf/if/then conditional.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> So you dropped the tag because? Where is the explanation?
>
Sorry for the confusion. The patch was substantially reworked in v7
based on your v6 review comments on patch 2: the compatible was changed
from const to an enum, and the allOf/if/then block was moved into this
patch upfront. Since the diff changed significantly from what you
reviewed, I dropped the tag rather than carry it forward silently.

If the changes look good to you, a fresh Reviewed-by would be appreciated.

- Qiang Yu

