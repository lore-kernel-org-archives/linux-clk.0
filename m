Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F52F12B3
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624209; cv=none; b=qGT1VG/ctGP4vd8TBHY/iCQSP7vm4IBEbHqYd3K6FkUfnQ5T+iTNmu7OWUJTIH56oONbbo1Ehr4TGDG2jV9Ih5W6js8VZWMU8FpXHfJ1SToND25SyvlErMPDeMLhdeHZ9Gc502lsszNWwFQ6Eeony0UxXxvgz3fmm07PFl6X36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624209; c=relaxed/simple;
	bh=5Y9TJJ7VC7jKty9WQXc0HoX3rML76lS1wV3BDQvb3a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYDeaM/mokSjevFo82C3nkAAPPiSSgVK6uIQTKxjNBsD7OTLeYLDYLNm1dPvnisLilYCqPZzYu2dTvoL5+3rxXFAyEOAveqzqqPL9r7O6Uzx1hAnmrZdp0OttI4iub88Zu+HHkJvs54PjSh1gehEWunJ8EY9/XLhA9DsPdCUSpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEaJIrG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mxt3+9i0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEaJIrG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mxt3+9i0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhrdg430696
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bhr1CXzyi2doW6X5jgohDydC
	UVzPecvU/LmdcLifDyU=; b=lEaJIrG/8MaB+VDEBh1p6wHDSHL+LNpgqqre+Kbl
	5/7lcp2rZIrlD0lhMhZrTEh72vHsti0jx/0fROrNwo6sMzS1YkY+Y4KihLo3bMGR
	Y8eX+lDnK4evaa1kNyI44kkY9l1Y5S95R/gh492F9PMyN4+pFv7EBUIBHbBCMd0R
	0WNsvGCqH+aD2i9OYOVuvrj2j+Hk8EGbE0vxVQRaiROcSKDv45Kxk/EB2uD9LcFr
	9HhXukOtK52bT3W4LlHOGnzedt7gu73uArljWTJffX7x9kSAGIwmoFfvx9QuaJp7
	1C/+fPTgYv+lNJwBNgVQshQfunx3Y1GLJpuy0Z2Mrc9reA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5haptm8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:10:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-950c363a61aso3212407241.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624206; x=1775229006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhr1CXzyi2doW6X5jgohDydCUVzPecvU/LmdcLifDyU=;
        b=Mxt3+9i0tv5538YooMWgM79YmXjSfQ8JEi2QqSlwnSbq+VN5/FOHmxzGnQ77VwXRBV
         egDVPnTvy9EnyHdIr3wYSPWYxRxX04ea7kz3l6xqkzr5z8hMkGUnjzaGOBa4YM/zK9Tv
         MH4hlZNDokyTjZQ2TSbqlOEKNctaYA7sTLLEDSJXUwdC7tVusPg2kkp1hFyGCMPxBrLj
         t1yfuL8Hog2KnjE05GS0v/9t0xFXChQ3ErdGCYHatFR+9BvvOvfhjp9/ttaIZrWPiQ/O
         VZUQ9xcCEPUawt/L4dEDIIIr06BFooXTxeC/da4EjC8UqqNhB0bsbfQR0OfheOn96pfc
         0KUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624206; x=1775229006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhr1CXzyi2doW6X5jgohDydCUVzPecvU/LmdcLifDyU=;
        b=Rtnb85C6K7YTpqJmCSTd2LFo90JXhsTzGYpOO7/XwbesSeopMvTKy/Ft5InFonm8So
         4kAfvzZcQGt/6LH+cQEUjOTwsn44Dd2TMC0NqcwC+2gYnC6viVNHFN+vUe3tfal4ifWO
         0crpGGtaJPEiKpaG0wSGjxiOhbpPTESUIhxcOYSn1V2eN9HMpVjNKkdWA1sboHkjvH5C
         k5mT5HwHTsWIRiZq91yCXEKhDk56Y/DqAvHO53v5CDdOrkcV3LrNbNBA5kPblXWMTH0d
         aXMSGbjmmKiGIIsxGiIy/OrWLx2IKvURhrA/nJQX+XDMapy+by6V0Guwj8M1R8IJ4mL8
         4kSA==
X-Forwarded-Encrypted: i=1; AJvYcCUVDbFiz+ZKw8aJY+RXtLfW3/+kO+FzRIuPTecWHWKrzfPHEz27PMtG3sxy16Kj/t1KMrEhE6BC3w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFNBWnJLNrAq1Lii9m4HqItfFbdoDFFk5znDRir0/citIgilgn
	ICRPCihw/ZsSe5GuUeI/byTtR5ldAXf31gGajMDHM5OPPmyyE510jylM9WA+Mys4P1HobNVnGKt
	QWQfYGGjQC1HWjYOT6rTMQtfVJXGb8J07kS5hHQ2tF5VWXs7zHyU6WE0nV21wLecStc7uOZk=
X-Gm-Gg: ATEYQzw631Xj+m7Xmo4vZY23mD3z8zchCOiVz8pSSd10e45hAwWSFeMAvXwwV+Fbp7A
	Vc2P6vvGK03UWLdtd7G1jku0dzB9ZGjulDLZVvWb7c81xF9qTqEMZzGYC8LrHJEQCqUPEobyjFF
	co0ydny2ioOiURgkdS897smnn9BR52pbwyAgRGILa7cD7vem8cQ6cD0zYcFiFxlUF6VuWR7/N7n
	Y7iSs6ZzpOlDa9TelVqECzGJyfi3e/1+UYyXhGkkAy1iGuOq1YPWBvdjZqb480iTzNjOGNHx+ca
	i43FBNy20rrU9thHjgFAc36ohBNcJzce0850+uunRqBvaYeAnv5ELSOA20UfJpD4mhgoRspI/jT
	6aUEjthfDLn1SMsloP/d1NGsGAZn8Vtpzvw==
X-Received: by 2002:a05:6102:54a8:b0:5ff:a34:6ce8 with SMTP id ada2fe7eead31-604f9278ae9mr1289898137.20.1774624206345;
        Fri, 27 Mar 2026 08:10:06 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:5ff:a34:6ce8 with SMTP id ada2fe7eead31-604f9278ae9mr1289868137.20.1774624205756;
        Fri, 27 Mar 2026 08:10:05 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919432f0sm16626365f8f.13.2026.03.27.08.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:10:04 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:10:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock
 always ON
Message-ID: <q63r4uurga4mxzdmnwt4adkqz5ohfz6wnszdaiklzg3rqbvjzh@fclk7fgpppol>
References: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-hamoa-usb-qtb-clk-always-on-v2-1-7d8a406e650f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c69dcf cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=flGS2D7TJj4J6cRu0g0A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNCBTYWx0ZWRfX5qNAiB4KvWZs
 rl23ZgYr8Mfz0Yvuc1kIsLdDp/ptSysWpMfZjbPgall+5fJSWbhciUH2UHZwX7Cj3txcXeVm73K
 kaRk9wHimSgxnbWZLfu0s7spGpil8KL5mwcDvnd/35IaJp4loUSrXt3jCuJ6lHX9DrRG8swonFi
 UCyFYPKeGXAV8eIEHtu4KfA2u0J6yzqx4vstQx9IYOfrJgiAU/pcnwko7wQ+WJAuAVlgmTyfwKw
 qG6Zje9ih+OH1lItGZzS33WETmOH6u1jdhLbGZMu/DPV+plBvpnq7lQXbrVp/YvODnfp9wmgqWJ
 wJNKdUN7TS4kuraMjskNVdMq2WvTCiT+lDgpC0E5GTR4C1PjKYB9K/JwubTfWWtOFfGSqXVjVQL
 DvtydsN4mHySQvo5GCsNxjw/nZvMNNQAcxi9NbZig0c2Cdu5D75kmVVhJjxkmgIkJhpqTQtaJam
 rjZlPrSlmRQVSs3r3VA==
X-Proofpoint-GUID: 3Tu2oLtG0q9P_Y72bWq5O7JK6LgkvAdn
X-Proofpoint-ORIG-GUID: 3Tu2oLtG0q9P_Y72bWq5O7JK6LgkvAdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270104

On 26-03-27 20:36:46, Jagadeesh Kona wrote:
> In Hamoa, SMMU invalidation requires the GCC_AGGRE_USB_NOC_AXI_CLK
> to be on for the USB QTB to be functional. This is currently
> explicitly enabled by the DWC3 glue driver, so an invalidation
> happening while the USB controller is suspended will fault.
> 
> Solve this by voting for the GCC MMU USB QTB clock.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
