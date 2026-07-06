Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5E841A764
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344356; cv=none; b=ri6cShDGEaFBO+XAcjq0bEGIKLxZ0looQZmMIrYuy+rU0UNGvM+QBuWcOm45iG9D/1A2lYSqOCVQsDXQZrjvGE4PRS91RwehgMJWXPH5SJaBBan5bVbJXsokMiuDJpKJnwDhkvp0Pvj66CFhABBiFQgcQ7NkJBGE3z0qpszZCOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344356; c=relaxed/simple;
	bh=2t9CuXwCB2vIl9APo2o4vPRIEb+dUwYD4ysd6rRlclw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFNopKdho2vgxiIQ7z15uMf2URkTXmJbTPJTI2+roYjieNKjNfkS+oV+2HyCVPmdm/oPwok0ebQUtn5ywEqH0K/zcJml2ubOtcNIwA1Y9G0B9AMzJzcsdweLMVYlOdo8/hjKknNLGsuy/kwIu0ZFqV/bXe94ojOrWn4SHcg2nkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VK/U3Diu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4URPOP+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VK/U3Diu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4URPOP+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDoG366717
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 13:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HNQVled0KgZDT93hmXfBB2xm
	dP8O3wvyGKZXqdF20ss=; b=VK/U3DiueIz1i3ItQHbF8kARojj2FOMsO8zG7GEt
	fKsvzYU3/tCPTGKUW44BPeqnuU53To2cb/sAdN0LWWN7M6AjP3EvcKvOk7wTKwBl
	9EFnTczJerbN3QAbcbyGhaO4Cu9X9VE9Z5fhIUQ5VCap0vDEHI61xnivWgqZaMoM
	fIAQmeH2nrTZrfJc8OVbcUvhvaZam2gXUofwrWOTqAtwQdpo1C1wmX02ASCqevvZ
	s/WFdJBCp8cMZkpU2EiWisM5cjnjG/dJltmsaAk6wgtYnAbC+AA6JdK4TBrGlt2W
	+h1aiRzgYh1ZvoyrEMM/5uMwoaFyAxIDtHO+zdkmGwofmg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891us3cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:25:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca3673560so13986245ad.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344346; x=1783949146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HNQVled0KgZDT93hmXfBB2xmdP8O3wvyGKZXqdF20ss=;
        b=P4URPOP+v/8Q17iBPgr5Y7MR82uNIXGAdJUeR2n1B1S6O1+iozbkbd1TS0LfmTz/qP
         GO8Oz5GeXn4kBbBEmTKts0zTHyw1oWuBJEC/acO0AmADVk1ZGei+qdSA/0L+6sXhijV6
         RY4GNo2cel14EKqB/QGrf+n/ndz4mX4+DISWr1GLPsOIIAOxzu6mONmBfoeXzJx8gXvO
         7F+VCz4cmGNsT1GSq8HTdo8cuIlBIf2faKSriFuhJtukK4GrqB5NhqOMvCuRcgOFJE6Z
         qg5WpXpx/9nQ9JjFo7gqL+gW/1TO8B+Wwdz+8NMI0NVSM+ErWgEyHsUS+v74VaU35RJx
         PqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344346; x=1783949146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNQVled0KgZDT93hmXfBB2xmdP8O3wvyGKZXqdF20ss=;
        b=Z3NHzH1bCvBlpppJF704xt0x1JDtaBoAtUu7jdwMi3CRDMrTcQOkKuyVU2BKo/nLsA
         FHdBHp1x+puFa7iPvgmAfv7BGbSRAvzja3nCx/Re1tI+gaeya1Iq6KRkEQ6zlD8WF1jK
         PzVA2BuHdmp55QwPwPiTfa3dski0bFjbZGj7gwxfGqCExoKNZn1/T1gjOWCyRNmmYoUS
         UCs0KwJZsIrKN0bL1ouZknpo+6F3I9tjjGyEd3Hx4wTGtRC5OfMyfccGba7oB560xWms
         GC03d5kxU7cT+XDKvduMCyV5O5J+2TCKqQrnQptE/blCiwEGEhKGTpr1osWL5Y5zAAe1
         KOnw==
X-Forwarded-Encrypted: i=1; AHgh+RqjMljVZ5iaJo2TCy21MbKzyBaH7ftOj9oBGlt8xJlufGxBntZGgjC9QzlhEec9M28jD0hgpuZNzPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDCk4YAdMRGl/JGYf+sOSekFsvhdQ5LC23OGg7a5FwHhyyJEZ
	Qr9cnAd/9VFEOsRX8kqyXMdodMy3yDhqcIKqDy6DsOZqoExSX4nUB9pXDQAVU+fQUL6euda8Ve3
	8Vy7W4+LvREIrfRd9d/MvSxRPbU5KcaNBIlkFkFfQ/l1T5ucmxVgJf+nLT699Qoo=
X-Gm-Gg: AfdE7cnqP7PGDtRqJtgCXYtJyti8MePN6QJCXe7nWL4GeYTqSYp1s9lb/iSqRIaUdcZ
	pCEHgKe6rCmTCs0IXxbZgzdO1mlqw/24clUJfdkZmElloN0WaFWLD+Jg8L+vuU6hVWLj6lDD62L
	/LL8Nk+3rzwluNGZWdJmVqpa8QMY4BQAr9jXkHqrnoqgFwTu+8k6mIi2PBTRUXyLP3EEbGo1/5c
	xbHkD+/ooFgNzZJsJNi1flA5aTlqU6ci1belThp2RrUDIk50DV0tAMhPRsCfmafo3OWu50Wuv75
	G2A7y/QKbJMXsYBnQLpubIrvpCmGk+N3bBF4b0Kyu8pLSBrl2oyw3noh1b/UE+MNFVoRiVWKzjl
	L/4z//jRkIzoQNL1wG6uHUq77CEKYeTO6ZadzbCvV5Pd7GNo8bUSn/9P/gQ==
X-Received: by 2002:a17:902:ef44:b0:2ca:cee0:e172 with SMTP id d9443c01a7336-2ccbee24250mr4750455ad.30.1783344345996;
        Mon, 06 Jul 2026 06:25:45 -0700 (PDT)
X-Received: by 2002:a17:902:ef44:b0:2ca:cee0:e172 with SMTP id d9443c01a7336-2ccbee24250mr4750055ad.30.1783344345483;
        Mon, 06 Jul 2026 06:25:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7870f58sm51690345ad.59.2026.07.06.06.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:25:45 -0700 (PDT)
Date: Mon, 6 Jul 2026 06:25:43 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Subject: Re: [PATCH v7 3/7] clk: qcom: Add generic clkref_en support
Message-ID: <akus1zcopzgPNaxn@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-3-776f2811b7af@oss.qualcomm.com>
 <e187bb2d-9496-4683-8eac-17a94941c952@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e187bb2d-9496-4683-8eac-17a94941c952@oss.qualcomm.com>
X-Proofpoint-GUID: DZa8Vdzm4Z-Ct02eSxpZAJRbX9tZM48I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX8K0HuuRRLLnj
 x0xfXjOpP1oNibA1xpmXCuRtdAUnAHMYt7IuearasBaQPGa+7WuJOcVBxTPB7PY/D5KbZlM2YwL
 M1IVvqCTANKXrEnWBXLW67m/0O41FmU=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bacda cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ukEeeJt9K7XwON3hb0cA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX9+dr8uGXoXap
 jdkD708Cf+3wOTQ9349xij5p9VtBE4BIx5J2VmnMpjkDer574zTOuNKGHDV+V3eTOTZMu6lMjvU
 hRQknd3s+1DIzwv9L3ddl2hqp8kclwtbtbdvwSNXgbvvfW8D7tLp1A52e2bcB7ncha2kTYAUCga
 sQUzE0OaUwo7fPwe2rtT9R8rC/4/6lczgwrjWr/xLkQo8I6+lQz9enVTQm5iz95qH0FTqxdIYXv
 iJ580HCLmaPsUPENuHYqb0ehhsNmfP/BFYcr5ak0Z7qO5ee0b/pa9eB0xhzy0POgs+rCFoylbsf
 +pFA9Qw5RMJ4ewLzKDqMSsSCzp6p21TXCYA04knfHJAnIUPJ0Ljws+RqwmK0/NiAwCxzze7atB5
 sAs/gGyOlkwNQ2RMR9KNTS1N85m1WP+KN6iF3r2DiGeX8ZlpjJMcxb3otwaUKxj0YydS7BPw7WX
 l1GcDSmyQ1vOU2oEqNQ==
X-Proofpoint-ORIG-GUID: DZa8Vdzm4Z-Ct02eSxpZAJRbX9tZM48I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137

On Mon, Jul 06, 2026 at 02:24:02PM +0200, Konrad Dybcio wrote:
> On 7/2/26 9:36 AM, Qiang Yu wrote:
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +struct qcom_clk_ref_provider {
> > +	struct qcom_clk_ref *refs;
> > +	size_t num_refs;
> > +};
> 
> If you define num_refs first, then you can have refs be a
> zero-length array with __counted_by(num_refs) and make provider
> a single allocation, like:
> 
> 512946cf0f32 ("nvmem: rockchip-otp: alloc clks with main struct")
> 
> otherwise someone will come around and "fix" it in a day or two
> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the suggestion. Will fix it in v8.

- Qiang Yu
