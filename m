Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B73CC9EA
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363624; cv=none; b=WymVnAF4Lb9WMJYVUhMSJXnKO3YCl231lUWzz07Qbmh2qvqJUX1cn49DQr5UNitnhWzVJIIfrseD2ll0aEtosyAUhE1yWOBaFNsGPuy0QkSOHp8wZMJercxPPewxazkhkgbQxzvjo7clcTLYpmekKkyTHJCkfkOj5Zqivm9SYgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363624; c=relaxed/simple;
	bh=n7lVczSlRIV18NCj9fuCw396ECEW1bxqAhAAaOQvHPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asr7+tKmJYY25rxCH1fMfQIXczkm6+pf328TfwpP3cRM179zp3Gn3jJ79Tvw+wz1uXUPx3iyZqI/f1ClPbrYIMeu2eBCoK+W4JTyB5xbYuokgc9uOptD7qXxkXDm0Eklh5AVDNty/mejx+3sRLqtUu3C8sudPZd94vWwoSlqucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJRyEDSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECX1Ky3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJRyEDSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECX1Ky3J"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SM5J2341940
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 12:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N0HEi9O2CzXx1Ui/rB9m47R5
	NYtN6l0Z2f//VUkgfGg=; b=VJRyEDSjUifcoWW5Kjw/0f3gcXjA26K9egL1Wo8u
	qnsKzXbi9SzEJ2TBUlYKmcwPEhICTGNdexNekSJpMzOaTiPG1RyjOndNmEVk9JkH
	Ap/K4othTW4jmYCpX4kg0xaQz0x44wawGqaYhW01boigrfEZ7hbeyrpkRq9xAZbC
	cIvA8I9c3LYTU2Eio0oySYrX0SCzc+IcUZStjbqKoUnoUAk8S5z7i/OieDk3sEE0
	fJiC3c9/29+25oLfgsJUNvSX+1yt3sO9D2xYYfTGmMyvrrUcgvV8F4pBnOJc2cnc
	8jHU0D+TKwnGX54pGLrnUKQz646EkP7iDkp+roVq6Xc0lQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kje30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 12:07:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso12638981cf.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 05:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786363620; x=1786968420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0HEi9O2CzXx1Ui/rB9m47R5NYtN6l0Z2f//VUkgfGg=;
        b=ECX1Ky3JpZK+zDEK+LkLXLy/pEd+eCWbUUmxLLLdcx6xB5Eqt9qFYhSNsZoBR0hHkb
         tE6QBoFaeIA95mPBX/bREY/wO2d0jvJGHZx4S/dNPYgU1gfTTJsoQWcsu/puEeytrFO/
         JUMEXusX6EfNj6VWDkM7FNanajDITFxkrv8SwieM+mnwhtxs4j66I/Ux2KYYHldUO1sx
         XnEow1xbkxWj/2mYTVufATCHtwbjGLbwYpHpNEpusBqZyETGvrY2Ls3tdy/xkkapGXmN
         +dHHDAmj976Med0zlqHHU9u3h35Lb5ASIpxHEkOp9mQMHUwNIqY/Lrzziqzr/ax5Ihr2
         cdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786363620; x=1786968420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0HEi9O2CzXx1Ui/rB9m47R5NYtN6l0Z2f//VUkgfGg=;
        b=AEeTP/qXHwvr/G/nm5C9YWct11Xo5GWIliDNs9CjtBftmkfcFaLwSvd7m3ygp/5+pe
         /vAZfyxIfEDU2Z5TLayJK51c1b2KMX0hWbygV4euDk18vyHZO6BZFxr1VCnk4keOkkra
         TVbZKhZZs30oVpWmwRXy9zOj8F5Kh3fqHmZ3m9P8wiEuBCzfCXSm9ZvB5R4DaGIl05nG
         eII0/RCrRq4SzRlm4a8PY6SZNhtTnFYLyS/KV20k1o/O6ts3Y6ILVC6OzRYBe+he3kCf
         9NJ36LZCe2fPPCDbYfXf2L8kXqXkco4zVSvuiBh3Y2i1iPZp0MKQN0EmxKaanuR/8P1R
         iNyw==
X-Forwarded-Encrypted: i=1; AHgh+RoOI0jpVw2TJDHbhg6PXhjwwAE8taxvF3K8ntSWvGkfDocHQZiscW0nLMRKmzcEBk8F+xk+w67dljM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY7XnOxYoe8tsGFF4rbpUYIniCqd8Y424ybkQMAF3noBdWlNxM
	Wew/UhKonLZ+UTwp+7XxmOr3LhOXOtQJPoHImD3PoicXCyM50T0PrkCNvK6FQESanti3ocYtKsv
	z+jL0gQz9Skp+IPRh0lj7tB92/GofyR49ojpjfe36fAawbM58eNUW+wt2koo3mmo=
X-Gm-Gg: AR+sD12lu02FBFN9TGiI8PjKC/Zkh9xvspSxrUkO/MP0A4H1hsasvqRP1vCeCR6Ztbw
	iFRkI3djgoEPGtYoyzrPvL6tQdiJxj6Cm3pwvhh0tgpot1lJKi0QccvCPqbUdcR9fTsz5amzid5
	L3lkizetZ4WIXvTqdtJT5uU/o2AnqNwgBNAOy8J+iDrN15Xf5UJmwIKzY8T3zTi6UfB6TTKNvkY
	cjPrr5AxeQE1jRB9W0JAVNE+RAGQa/b2WxdRw5H5TORDr/iZltV11uJu4xYCBWBVAvdUSysanoS
	OOmeQ3CQd14fDUWHJk490LuNL4Ru+kyEIiHsmIipORbgTRJf1Thf6b7IQKJsHq4ecLGAyRc93qn
	o2kIK/pY0nKI=
X-Received: by 2002:a05:622a:14d4:b0:51c:94f:8ce with SMTP id d75a77b69052e-52d4c11c3b1mr9645831cf.34.1786363620358;
        Mon, 10 Aug 2026 05:07:00 -0700 (PDT)
X-Received: by 2002:a05:622a:14d4:b0:51c:94f:8ce with SMTP id d75a77b69052e-52d4c11c3b1mr9644721cf.34.1786363619693;
        Mon, 10 Aug 2026 05:06:59 -0700 (PDT)
Received: from oss.qualcomm.com ([82.77.85.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8f33sm39949757f8f.27.2026.08.10.05.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:06:58 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:06:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 1/3] clk: qcom: gcc-eliza: Fix always-enabling
 PCIE_RSCC clocks
Message-ID: <o7dyjhfig543yd7aoxjvcznzfbtvkjnxbta2lemez3hefbhuhe@cmuw7g4bse2w>
References: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
 <20260807-various-pcie-clk-fix-v1-1-5caf78a599d7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-various-pcie-clk-fix-v1-1-5caf78a599d7@fairphone.com>
X-Proofpoint-ORIG-GUID: bCt-x2B6-mi_ninX1jOfA6Yne2gAOeqm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwNCBTYWx0ZWRfXxtz+R/KliHA+
 +q+iNmZPJ2ZGPVGaJ/V/PDEUU7j+APmASWiA3QOgb/0A/NwP/Qj2VdDaZh9tm4ZmRcnvqu4rpdB
 TFC+bAQd7A/l7q7fhfjsKH8iAl7+W0HvOReMcJKzEorRPSvKBbOAIsqpRuGjSS1AlzEWgRjPz9C
 kS3JcJL59KEABOtrHdtXizDDEjbffpXPNVrWknaxxx4F0FhIEYEmvn1fhlsDaWW1kYSqdcQIGYX
 yR+bVfaUW3kgvgQHktcev/WandLC/telDA+D0qMStOx2NIHmlEwYdz0tSaiy/k+1yfIOb7Ld+cB
 40Cedkyre8tBF4XH1NveL+G/vc+fXdECNXibiFFOIJJbxdJPCdKQkbMg1dRuftb25TCsaHolYdl
 gXRgNL9yWD6RsTTT9Djk6w1TjrabC2d4AW2Gh0KyvVnQ1cuTyua0AX2N3PDCBpNAg+kdsrLym3q
 4xnb670lD5AtOHEgsLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwNCBTYWx0ZWRfX4fwtqQs7kFPV
 LbA2jtW/bQtCoV6jzavQaDrknYbypdAAmvyurDyhsFgIwXM+XPHzeDtcC0zxhApCQRTgKHepoJX
 nQRsulCA43nTCr2wmgrKICljlYcAiLA=
X-Proofpoint-GUID: bCt-x2B6-mi_ninX1jOfA6Yne2gAOeqm
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79bee5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=GMu+mMXmPKlJm/I3Pt7gOg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=wwqkVmZ0C2PESZoyeMoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100104

On 26-08-07 09:46:04, Luca Weiss wrote:
> The critical_cbrcrs array will get qcom_branch_set_clk_en() called on
> each entry which will set BIT(0) to enable the clock. This is however
> wrong for these two PCIE_RSCC clocks which need BIT(20) and BIT(21) set
> respectively to enable them.
> 
> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Tested on CQS EVK, which does have PCIe endpoints.

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
