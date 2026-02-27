Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8921155326
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772151186; cv=none; b=JaQ3ofZ4NM2tEqs+ZzkSZZixdj+m5xJc3uliGIgojhL7h01HEvuS3XrY6zK5+7DTcESdHszCmppot96pNGW9ywj//GzJHe2PnCysYY457t1ZD/aT0PsCmTCb8Tb6njmGLTj0EMUTI27uajMhPC2csV1M1j34AkHsoiB7e2RKcNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772151186; c=relaxed/simple;
	bh=ZoJ0luas96X91hkPWSbSnwHP8sULaRoJloAEOdcSynU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsgHwVsgpd2S1TWgQulG+zd4a8/s528KzbtsPLf+npWoAS4GuyN3EjPfCnI4LqgnmQCejwB4Z+FUOT58QVDUkvA3UesdoPNg2wDAdjEKLa3XA55uz+73fRgFAUwAZV132KSNXCm8D8mhdIfu1RufzsJn7DR5sqH8iygcxi5KnbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5gvzhmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtUAx/eJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5gvzhmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtUAx/eJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QMac5Y1407025
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ez1lx7G6CRffeJqKJSqvaQuN
	VhJe+YNXpf7lrt/K510=; b=n5gvzhmOHroL/dMUkIj15h6rVfB26oC8jmn/DgwA
	URYtwgKnAnf8sThlbMHDiWzsux8tYCIh/jmYaJM+08+ena21r5zt/oKk425628bK
	CJ94N3lBmlgqGLEoei7g8JFzJesDB5AL1GrukZFGQmfJAPm3v1K1nFjA0ScsREA2
	+Hsjl0k1UfwVvYm6UdBzIxRh+Nntvf3qYDVZOjW35lWGtpEBH6sIWQOp7NFtzDYj
	vhDINuLcG6HQk6g4SEnoglfP4u6uMcrHlux1pJVcss1Wt9ZwgJbrPrVemAqdvpyz
	dlWNP/HavlbgaLVfGg/3jesMnw/uuppoqv2TPU7uat0LMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytrwm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:13:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50620483ff6so138431381cf.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 16:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772151183; x=1772755983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ez1lx7G6CRffeJqKJSqvaQuNVhJe+YNXpf7lrt/K510=;
        b=JtUAx/eJ3K+xW5LHeZR9pKTJ045dZqzjMDD7lcYnkSKn6WkSHSI1yTpDU6L3oBDT0J
         wRAFIKZEoDvXXs6NOnMnJESfIfGaK9/NInjmHcd5dXy1E/vXjDGlNzvfGGKUoAxQX0Hs
         S17JvGHZVz2WHBpdnwLwo2Jr+FOAfWTg2uJVwMQR9C6KxfEQHl6zL6x4aEsIfmnpkV+v
         P0KlvzsNpwpSiTYuTDiAvWocp7pKL7vUO8f7U79mAwcWAFgNmX78SxibyCo98LKXA792
         HE80KHaq0pmQSRnemGx1sySUtKSXDWyC1N9yVm1lU4zRz2Dwuz7Gp3wTsZ+hxr7aBqil
         X0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772151183; x=1772755983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ez1lx7G6CRffeJqKJSqvaQuNVhJe+YNXpf7lrt/K510=;
        b=Llu6yRjkH+x9deW3iOdMeBuq41u5ucCb5ZehRjfwmxDd/sjVFvKTbPw0M275pD3Bju
         p16pkwVSXYFXAYD/JBkr5rUkcAJTtDJ+U6/o7tDc6GXhQXcIQt1fAU3cw4p31/MVgyMw
         RIHdA1F587DewG9OhrefOI2rkWJ3AYBM6glaVE3UpXT29kaNZzEYXD5PzTEByA7NFQFG
         GA1bBfnS4rjNlYR439kNjhcxS2qo2LARgN0XgzW/+b8eOIojbdpI030ncvqHoEPBLLrS
         K9f470EpywNCss3os0ecukcwVkIa7vrrT23OGMZcZibyvEHWLqHmjvLxNgKQBEPTGeun
         FptA==
X-Forwarded-Encrypted: i=1; AJvYcCX2L0jMYtcGXmiw4aa/OO05vvgIQ5R07uqg8AoR2W60rSnGHlY4+OcLFnijjf1feIPB33pAmye4MNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY7YbFVYBcUDZ90ALm4mfiVrMpriKJi/znfs3Emt2AAaKMY7eU
	pMs7q3XDVLg8ndVANBoK4dIh0JU8/IaQXhFPvCuanA6r7BmUN5DF9kbbHsterFXVX76/pYyX2Mf
	ZUhy6zh6AjtW0b3NcgCbk/fgdzDmDppLbA17BY+GBodUEfooaKUgRrQFkEWisXGK8SR70j0k=
X-Gm-Gg: ATEYQzzP9+Z3xJA+mDfEgB04TQouMzQZgqB84paWD/CLRpROwJcrqEzb10GjCiB2FQK
	0x9kNcUIkYrTyZ4vzPkVQ3oKbhS6TEqsQmXh09sHn39hbVwPueq0Q9VZtPIq+Uuf5JtEBjel/rH
	+yh0e31GqiFf4xUMcND8KyE3H4yS9fwevtt0vE1nuAvVb2gP+qBJhlVrN5+nafGczBJ2LbbSAQp
	fCRDggP/DgWlSOS1Etpin5QYsYAxCFjDSXMWICMoxY1EGv7h7qHDJmb5z1ocimu8I1e2OPXStq/
	OaoJqLicUNnxCbj6xtgrAj5HAn/CNq/4lVyvUnHUK1E2c5iKOxeZlFQVLdzAvxBmdKS+qxIG6Ll
	ucSANPsXOuBOFJ/tOzbNv9/MTIpdT5SoK4QnG6kL/Wb/2w1RDCVrE+HP3jR9Tn8PWT3TVraiM+8
	ov4qKeffoZNk22iA/4u6sLX8mpi/10E5LIhQE=
X-Received: by 2002:a05:620a:4151:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cbc8d8658amr130611185a.20.1772151183025;
        Thu, 26 Feb 2026 16:13:03 -0800 (PST)
X-Received: by 2002:a05:620a:4151:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cbc8d8658amr130607985a.20.1772151182593;
        Thu, 26 Feb 2026 16:13:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3021eebsm11008631fa.39.2026.02.26.16.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 16:13:00 -0800 (PST)
Date: Fri, 27 Feb 2026 02:12:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 09/13] clk: qcom: rpmh: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <pzxxshl7l75xawlbbju7p2aoehbsv5tce6yb3rllv3e4fzpond@l7x2tur3i3ih>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-9-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-9-4421dd2f6dc6@redhat.com>
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a0e190 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=20KFwNOVAAAA:8
 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=1r2m-iIbPs-O4eL_W2EA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: QCvvRen4L1uhKwDBfcl1hegjjUwEsRTf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAwMCBTYWx0ZWRfX5695dfPuHbmc
 s1qjm+JUE9i0xqiJWLEBXkx0D3F44WzTLlPFXcONt4QOgpngZMLZXvvxlMGx4CnBo5pkAMjaCNn
 WwjryGnDJU0bHWdpxlIdN0sIOAwsTEeJdcIopbF0iriEh5We67BwTXfzfizFXxpbWLZr85wvxJz
 5+92EXqM7iYB6euZIZs6qF/CiXAnpPhNJNc5/ED4gJKQHfegTtVdYOQxQ6LTdAio2p/CpnLVbNX
 724LIBioUo1IW5piFlRw0UQm9NJV1nHQs0Jwhta5LKGuU3mHrAA05ErUhlv8HQ6qla9wKSsg3YW
 ix4rRm7DbG5/jMA9Pa/NURpstTJpBRgFbhvnrm1H5P7wimS7vrCoHkg0hY3BEwGF9dOhRvUmcU6
 t2vpHkR3bJdu/80FD7P3myP5T9EblNhYY3kXCPhBnCG3pe8S15jGqfLkDJ/0JCa9mI/F4OJuH9l
 aqEkkXgsqfLOKAy94ZQ==
X-Proofpoint-GUID: QCvvRen4L1uhKwDBfcl1hegjjUwEsRTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270000

On Thu, Feb 26, 2026 at 01:16:53PM -0500, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/clk-rpmh.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
