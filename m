Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4943E3DBB
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281529; cv=none; b=A7MScBC9fXdiOmvAEt9/hUa8hUdIXjhMh3IimfcjTXNEtUnO2t+pQbl4h6JXq9OI0zfe/EopifsF6eQsYP2aDZAhq5CeP+V5AmJ9uAsa4sbUGLYX9dDBW5IQqr0fT0sgG6DpRkkSuYPfB7N0iAUQAQQHllIWO2m6mrnMRW4gmk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281529; c=relaxed/simple;
	bh=+8UCKbpfiiuyr2o1+4v37eBAhbK9LnzHdB9db7Kd/Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HP4W/R3YsoPBnTBjp35C3nr1234w1ReJGoz0VFCKE/hrvgxtCdJ3PeEsoO74sbgmR8qRW8wVXaubvlzjqzd6KDJN3jCTzHpKriJSUqkA9m+J7FFcqfce7PGqo299QfbXOThNAsa75m9lYq/XB6N5hIDHRnlPLgF0DzHPAb5gyeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WV/gfLhC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvXZMDO5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WV/gfLhC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvXZMDO5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6chul661854
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 09:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nyN5Tz87c9ukomENRrL/LBmY
	2gEu02TA5TMmyxeBlWA=; b=WV/gfLhCfxqXxDDAYN8E0AsVhLStzc0bJm5dPDVz
	rnGX9izdwhejK7XBJ1wwiQHqjg/kbOd2scEVsbIlrbyly6kOjX3MFpuWyDt7VUU2
	kcEHFpB7WOaDsPqVOoUVDXgbKT2JG2h+eJ9cyeoagiEP4IzcLif/HicXLGeLhJ3+
	OnUyInDy5zfL5+yLGvnHNremIg0yTesr2bvi9UO/S1rGAuigCzWG99LkLX26Et3k
	cA+YbFZ6RPSJ5oW2w3D6zF4SAQMSedO/n/TO2NL6qt7XDxHv6wLFv+FOlBkqqRyj
	PZXjzCtBo1+wGhuditt3oZ5YCvOsKXRKfwkJJjv4ijw+qg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9ksw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 09:45:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84842381150so13497124b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 02:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784281526; x=1784886326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyN5Tz87c9ukomENRrL/LBmY2gEu02TA5TMmyxeBlWA=;
        b=YvXZMDO5JQxSo1Aa39vNQjo1SMNvsx+5fS+WrnyLYCNkoZoG9k6b7EVz7Az+DXWf/2
         2GUwxo7qaiYz2cNypCUADZp5qrpa8Bu9aHEXoI/RxxvpA9AaRRG13wXIm29YQ9HsbmHU
         rlYNVE0sO+fHY6tcsY3Nh4r3oOzKa+IgPYWdLhp1ByZjC/sQPbyMCgJV/o0xU7nqRMAl
         0837vujIhJoX3Sxqa2l6d0hRlG+4tUjNu6ah9xq+FY89Pfn9sBFB8fHIH3Cq4z6Oz3SH
         eRTAfUTHjFCp/QBua1nR3ZPBs/M2mrv6JGn4o0YQqeYGmAqyFj0P1mZU9ZbixNv8JY52
         QZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281526; x=1784886326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyN5Tz87c9ukomENRrL/LBmY2gEu02TA5TMmyxeBlWA=;
        b=WOKsvC8ePj815SDWwJ8I9GBmMZKWbJ7n6jO9iOC6UY9cNp/5zP82t5rUIsqxuO0hOk
         nmBUpAbtwqMtLnnxtQ1E9fmd/JJW/+YEdRhE6SoqTXnWxoqnNytH5lnyI205j82EfkPS
         mqjCfG0V/2pSjsy+t6eiNgHd+YlSbpHWYloxU5kkZT0Fw7UHvZzJ3bH2oUYJBg1jWDAA
         3eD3hwhpLlNxpXBQqWl7jBrwTq3Cy/fLb2dqs4O3QsJX5qcTKppF04SjzAy7tyNBmcpd
         YrGbrl/dTHWe+7Tp234qJs9SbOsu4Rbcuo4h+iADzXbt8yzxoa8nHdag9IUDgIdQ0hSR
         XKzA==
X-Forwarded-Encrypted: i=1; AHgh+Rpsl1eFsQ5SbVpfO3bQpwhI+k+jcMlAXsLi0dMMQ2wvmI16D6cOx8e1YjyMg2qxaRGHsvu2l+BtbYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IG9DXZ7bWRukqN3LTf1lH+qYfGy02Wv7+jwWZNjonbV9XbHX
	dr3eLKL/TZS3tuCB3MZLS2XXLTiPx7VAh+PjmRViESAsA2n74+Z1BhfBwLbOZehzPwo+9hDxuNT
	6XkUsFcp6t9ynl+0yyay8P8jRF7bNyZ/sWOkMtBUNEqB/zZf/k6k99NN7Rak0UOrXQmDYKPo=
X-Gm-Gg: AfdE7cmieRm7avTlMjsPbE3d8KjT90p0Ux6VJJIwaW5pQi8zl/KCQr3+crc9h1bYDFQ
	jwJc890qFF5fbOUxMrM6tvIOXGOh00YdIevpPzTmk+igE298mMtpj+xn0oS+CWXWua6gz61wKAl
	hg3vYrpRCPmjezc68lEevNuMezJRO3bn7DzNn2XvZxiSgfJxFSGqppEj9kaBxfLaFjsyWGSXZJj
	hKme8fx9tZlRIEH+WSlK2C0TCxgIAuTAKISrLZB09Q5TMSwCeBTHxKXmDILwEnKnBUeU/MgdI8u
	BRpKR6tbWbLKSQyhiPGUAkZFDcZsr27fUtCcJMXD4ZXgpWOLzAUIsbDBhJ6vcNl0bfypkULGf2D
	hsgMgcjjY7XNMzg==
X-Received: by 2002:a05:6a00:928f:b0:842:3a98:b34d with SMTP id d2e1a72fcca58-84c2931087emr1910455b3a.31.1784281526122;
        Fri, 17 Jul 2026 02:45:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:928f:b0:842:3a98:b34d with SMTP id d2e1a72fcca58-84c2931087emr1910429b3a.31.1784281525649;
        Fri, 17 Jul 2026 02:45:25 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af30c89sm707423b3a.36.2026.07.17.02.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:45:25 -0700 (PDT)
Date: Fri, 17 Jul 2026 15:15:19 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
Message-ID: <aln5r5dT0XROdEdM@oss.qualcomm.com>
References: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59f9b7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WbXkgyQLn7-7E-RSUvQA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5NiBTYWx0ZWRfX07pwbyNBIowH
 Dnq0FjO1/fnpsxp7j/qINfxlswcU/0xhC5JLEHA01iPctur/ktZZuQrfXxEscJUMXrIl9TE2NHb
 IEIPghhHB+XxyfKDTZz1I78m2HWqxuZAi7uIybyeRirMSkCIZ8V+VFzZ9jciXMCtbWJZ3x3PgUK
 tx80JCPzEgFvlbw4WbnjpERgdk5WEp+CHYq/k/hHooQphIDH3OvBIOQF2yTSsmfwfVk2eJVlVZI
 bQUj3a5bFRuWoCx3NUYB0tLAFhTACCPhmP+5VZbm7IGQqAFc51VILSIf8+abrvPtgQU8+/gMSDp
 ZQ1OEZgupLh1VayDby1Wa/mhGTyrewpENSTkYkd/rUJBlz7L4Ve9BAhnLIFpZB2RYr60p2j80Oj
 BEdsR4+ftkQhlOemN/U4U8zVSBKZ5Fp9Wzzh4Dqt916RYE1ZyRiyx1+GQcXs+J77kut+tUeSScZ
 H2bkpGAjO+ie3wGEsbQ==
X-Proofpoint-GUID: haJZQgFybdHJNZHZajPumoZcXmFl4cpy
X-Proofpoint-ORIG-GUID: haJZQgFybdHJNZHZajPumoZcXmFl4cpy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5NiBTYWx0ZWRfX2GvJkA2M2FKh
 MOuQeKGQ8EQC0ES4DiPeUj2TXbubn3t7lhuThviOJrVFW3pjrGdOHyOWBLjEm9unnHSoR8sQ+pl
 tPXO+lQ1INnAWKTwZitVo/0TwzPxPa4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170096

On Fri, Jul 17, 2026 at 09:33:58AM +0530, Imran Shaik wrote:
> Add support for additional GCC EMAC RGMII clock frequencies (2.5MHz and
> 25MHz) required for the EMAC use-cases on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Tested 10M/100M speeds on Shikra EMAC with this patch, so feel free to
add my t-b:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

