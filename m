Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4123F34B40F
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742854; cv=none; b=O6aN+q54YeFrAr9YJmr7K5zudAt1Znyu8VdXJS+gNd4vQ8QYKOyDP3wILZKFwH0fSxRnj8T76PG4dCDhNek2JbCpJ9YYyoeGcjNojz5jsh7w5znpJc4tDzAP4wc9vJu907rx/Onm0U8NHu6gi1JtM4PQI0hPXnZJKifHi6HI7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742854; c=relaxed/simple;
	bh=yErJLL98hdTML6PW3FH4umtbW4GXGMxBn8V/sVJPrCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVcpvtqU0wyA+OWmHiIjHT+EexhvbqOSRtpNLt+2gW+GgOlx4W/whHE9H5GbamuJF3fkwOa/Mjd4X9aAAQ+IIqj+gn9XVE+a5JvKH7IHbnnVunownvDmGCVXe4cGZhzpIndljIogRvBWQ8w4PJ0+G+4uyd7xiZbObYQzZkhJTCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeCjkdQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esChuIhf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeCjkdQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esChuIhf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CxnsI1730055
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 13:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ARYmkRPpKFMxzpNWiTfhAHXw
	TL85m+s74YxRm411o+E=; b=LeCjkdQFSY1SNeRMTUnMZDE0TIRyJTE+U4B4jhNy
	BMSDfqKyxelqxXjDWYGL344yhGx96le0BqUVUVyex6OCqvs2nCaVJ/X7oaSSvJCS
	r97lGvIZ0OaiO62hOkCJDPFG/0NYFjE4RHzpO2/RF0wRpiWw1i1XKqVYfraFTb0x
	VsAFJfbBQxJdG4hzz2ayrqD0si5wU8bNYX7gQRs1jOsyeUTFWY9cM4EbEmn7BuDW
	P9iumCIN5BFebWyYr7Y2bgbNBDcyD5cNd9TSfDzRd6xpNckomtIEcxOVpVAezsX/
	jB8cixACnUNtMuIbzSxOfnt4z4edigxusBGcieiarTYHpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxg6fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 13:54:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d63962d83so25682451cf.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775742850; x=1776347650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ARYmkRPpKFMxzpNWiTfhAHXwTL85m+s74YxRm411o+E=;
        b=esChuIhf8vUywk1w0EbLISTKmlituwvRxni4hl4cDLx3W46Xoqy+X8fyhv4COh0Nu0
         C4FSU7rKmjo0MSvO00JXXrv7n4u5xh/SywPWW9ykPoQo1netGfDs3GYWwJwHZpUL6LI0
         xYURNyP2c2Q2hfsY2nC48huWmUyN6/Rw7YQ+s4WthFosYZLBL5GkUADb9wVVwFmPKdh5
         gvyLwNLRw+KoqHMIWIajI1Hxv2Ne+seom3FzCdq8voBY6hV2vzdQeInIalO4cOJOPM3Z
         bgM+WGEKGTs6tmWYXRUsxLBSLY2uKVGZKvhMGrNzGSSpEkea31ElYyDdOmYwaeI2jGlm
         Vpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742850; x=1776347650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARYmkRPpKFMxzpNWiTfhAHXwTL85m+s74YxRm411o+E=;
        b=nWDHm4GIyJhHnNGUp4MkWDiiFlCMthVhu6NrlgsGa+QYNXcuxewEjH+dlCR6L9hEp6
         CaXHDcXcFfNg6ICPSZDuZR0XDC1dT3r4JEKIapOxnME5dQf11Os5QNfj0+TCFIJefPBL
         n9sEWOy2x/q2buHk/GjpdLKSei+pn6Y+74LK13acFN2Z+8NNQJjyVLx4MTfr1iFGVcRc
         1yWppAyx5IO1GWcbAulRUzo+rydOtEahukgxh3t5umpnb125VewlTQahfCmcg8v/SSOB
         hGufdLxdZN5yldmax8f6zIGpaJ3YFToGTooJojqAc3IzmpbB+T6PTOblkuUu9C82zoah
         vVSA==
X-Forwarded-Encrypted: i=1; AJvYcCUf++ZiES5ljQjE2X6fB8ay0yoE40jX1b30e0dR5Fiz8sfE3VXPJJs6xcPCe67Gnn7WFy2BxSeUECE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDTyq+KVO5zQ+Gy5lq2gdf1GYRUbbkTXyAOT9DSrGHgGye0dMx
	xwVOIciaNU81dArjyVOOwAD43kDsAgkVRONJ2amo7wJq8JbDerIdelwkKHbz5uTjqR1wA6VflGa
	QeGkNlcfibEqAsKW7Pfw0tDA4q6GuYc5FsxbVwf0GPjrMwMBkb9fKMd9ptCbv5oo=
X-Gm-Gg: AeBDiev+cb72ChYApq22FHZ37k3nKUb9SOPgFRs340R1MjBf9xlVkTboJk5DE30bUxn
	9QXpbmkfbGYZk1FBDd9evKCzhn3AGldS2TNs/7hqGAzPV6MVnlYCzmIriYB1LmgdhQ2glcCALSp
	b8y+GNGijvBVndXyE3sBi+WgBwiE13GLHBtusq6jda9Hz+GU8olV1P2XMe44Djjos4EV/+ICI9h
	RToa2v0Y/t5O5t7mCs+7uLlxwpVitpn7K/CUU/ttYRpVZ4xPGXSg5Q4cXsI+MdfTiStMBPSpio/
	BWc6/nyrPcVQQOTg3apUInGe4jUyFAPgXnFWLORCZO1d9+DJT7eOUkh0vlQb6tHzQBWkGPtJFBr
	Sc+75zLskB64UejbunOfhuQS93Grt3e8=
X-Received: by 2002:ac8:5d8f:0:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50d80493031mr282328961cf.3.1775742850501;
        Thu, 09 Apr 2026 06:54:10 -0700 (PDT)
X-Received: by 2002:ac8:5d8f:0:b0:50d:8049:2f22 with SMTP id d75a77b69052e-50d80493031mr282328401cf.3.1775742849909;
        Thu, 09 Apr 2026 06:54:09 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f73sm71965374f8f.8.2026.04.09.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:54:08 -0700 (PDT)
Date: Thu, 9 Apr 2026 16:54:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        martijn.de.gouw@prodrive-technologies.com
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <l5fcjw4okcpk3nl243xqn7y57nr2mjjspjdfl6m3pi6smx4phb@2qp722n22lyq>
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
X-Proofpoint-ORIG-GUID: gw040ufeW2UwtQeQTuFV3SWQy5CTBfZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyNiBTYWx0ZWRfXxryiZPw07gy/
 RAAp8wtLlRsUPaungaWj7qGJkxCQEbuOxJoRVqYjrgR2wicc0ae8xA+FviXYclNU8s/RdvNGE5t
 S4EHALWTTvKB6gYdT5xjC40Z6jhm5VTpGVgqKx0ygSgvCr86MF29RBm2rZl2rmtfpyn4AqHe4gN
 ixh0UeLN3qbr0WGQxSyKXx8cpYzhE6J6ZGHhT4xJXGtV4TKULf4J9l3BaXlz0thk6SZCtdHSNAp
 DRyXclh6Wj4p0/TKtF/HOla9qS4ajah9X5gIVMB2QKzFfIyggYddDSfHBS1O/s9LWi+x/O4l8Hm
 5x1J/aklceAuKndKk8bR+CgfXBT8Cr4iLH5rmV4O7A5YIBTiXwip3lYubO9zYlFaTaIpYuhk+P9
 ZJ2by9pT73AtsJErJYX8HKadwyQrGaKPnIt264C6RcuY3LZPqll2/dmxctbezplaUrMLRUxXJO6
 7Be7pH/SMMkt4xbmZJA==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d7af83 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=926zIK9uAAAA:8 a=G5Tf7o8FmGmUZZTT9RsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=LlT7wNnaD8DP1V76ktP_:22
X-Proofpoint-GUID: gw040ufeW2UwtQeQTuFV3SWQy5CTBfZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090126

On 26-04-08 12:13:13, Paul Geurts wrote:
> The i.MX8MM clock driver is implemented as module_platform_driver();,
> which makes it initialize in device_initcall(). This means that all
> drivers referencing the clock driver nodes in the device tree are
> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> 
> Explicitly initialize the clock driver in arch_initcall(), to make sure
> the clock driver is ready when the rest of the drivers are probed.
> 
> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>

Nack.

Nothing wrong with probe deferring. It is there to ensure the order
the drivers probe in is correct.

Plus, moving it to arch_initcall won't solve anything.

fw_devlink will not stop the driver from probing if there is no provider
that this driver is waiting for. And if there is a provider that is
needed by this clock controller, moving it to arch_initcall won't
magically skip waiting for the provider anyway.
