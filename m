Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BDB3537EA
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777116230; cv=none; b=mWIie1ZgtBD+N7AjrpO+joZ8tIlTpdyrFzk1vm4NCji99A3D9nhkYPY9MakLh4fAsN5kGPt4f3NFomLYrtYFmBXQpAxOUP7ncnmkbyGFOicita6kgIUXWQoeR1YQi+hoRda1WJ3vByfgZVj378FK1HmYd2HYgYNqdGttf8ZZ/0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777116230; c=relaxed/simple;
	bh=34c0hEvFTLJTAz90CQGX9s6Hvt09sv0pDHtaKmeta5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9OA74cSB49S5s1nvMKZWTDaPOLuztiw8prPmkQ8SZYgbJF3aChC3EEtbNgFSzkZ/UwsW3xgeHif+SrFiqY6fecjcmXiXu45zDL1TSl/xu4NjmmzrlEg9GbCXa3cpwyfBZN3GBDXR58iCueEQC13llfB9K+UOrwOE89MekiFqSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQMfRPhJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+RdeZny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQMfRPhJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+RdeZny"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3S6AF1578831
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=; b=BQMfRPhJ6Od33set
	Eg/xsxtIu1Nq+/EPAJqY30KFa79LysRlUM3qSMP/ZqD0OuW3gBZk+TeDTwrwkhBD
	T6IjzSGwyRupreTPxrVeKhtvm5wE/TH6YX1vWk1ezY2iiR9yOlenKCqtQysT8sH/
	7YSLYQgsK1ACgEPuOp9qG7hN0lYzDPJCMwKcTGYHrQSyNUTjKExPXYaazh4x0r8V
	n+MtQgFkfBxGhPuPU0G0ry14QOJ3vDhXZK9RTsvKbKC/9s3sinkRfG+CVGmZSWQ2
	np4BY42cA52P4Y0rUOyxPsD4mabwETf2RzU1+IeMVPCLMY4lqJokY2FVJFTesJf0
	mZON5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqt8su6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:23:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e423a05c8so100209421cf.0
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777116227; x=1777721027; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=;
        b=b+RdeZnyyze++zpnjU0Zs6KE8Cb9QVTMsSkMXM1FtwYvl8U10nt6pVsq2HI0UO8tZk
         nX97+sFW1PY5Vog9xIWO+GR5FD+pL7vu6LkZHElzFxDiOT3YMnH5xYI8BeJ7YHrOABly
         hCep7B/pa3rvAYtGSHcqyhxw7AkmFSodKAOqiCbyV3LYdeQelkEdP7pJlPNvsNFsqBZd
         lbyQ5lmiKWyAj9PIUOCRDanLtbRUzVgSnRFbeXFAOAdiFjuP7xhnzdVAZ0JOyFMmJei3
         PacN/ITRbYwijCtwEduq+9lLxx9s+9+796HGnRVjpVbLSVKO5q/MH2gAOV6YFB0YKWvX
         7Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777116227; x=1777721027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fH7QGZwbDCoLyO1bwt3VrYsmvxr//vAEUJI0SlOWzQU=;
        b=l3NRXTOBvJK+r84YP8m4lxdz7vKdjuhGpIJI6CkhiKeoM7w9KCVTaH1ErWfl1QDdZ3
         jAz/nF47Pn/QgoqlO9gKWMUitb7LT81UmBWk5HUxz/SiboVzi2zEjc/x/vT7Kin02Gsf
         abOmwRFzu6Ka1Qp/WawrVxwKFZNMrkesRKtoo3tMb2DTETsLD42wjtyhHz1NFCkAsULO
         rn8cLIVx47Wospke5O1ny+hPb+FdJXmAAisoi0cC4qGEa75OqwL1WczWmHv4Nbfh5z7z
         O/2d0WkCaUM8XeZ2Bhxo/JdgQGMrcpKlE/MV+1ECP46GO2TQltHf2aWdGgHTMZbWI0y6
         FeSw==
X-Forwarded-Encrypted: i=1; AFNElJ+noe4cgQPO1twGIFvgt617CGmY9juyHibSAr2c5f7qywh6hz79o2pWaJBSa6m0bnmQzPidedKDUVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6R1mAntmt2NevRqFSoo/7VjUFICQQWQwoEuK4ZrD/+2jFt3rf
	pv0sAOqUZcBJ1jCI/cPJuncYuwhs3GZHb1DOH73v05KoGKByi4iA33IMfAwt5cLd8POtuTwwc1U
	zaoCpp7fJRf6zvlIN0cY+YeyBPZ6xwVawrAazECRCMoZ9chMY7DKAH0QgcHzX7OU=
X-Gm-Gg: AeBDieu+kJ6kl6Cw9V1rOc+tnUH9rfQ9OmZH2xkdox5OkMsspYk0Kg2XSGDIwkYT4vn
	dS86yy9Mb9kKRrpBKUPKXTdRGVDi8YVnLCEvykD07ccTpYBFz+cegKQPo+qWeJbn3SloVht+2S3
	8310O5YvxDzcmNpGqHnq651VrAnJxXmIWp7Kf54gr4JSzvqtritWKU3519ivlXQjHaQwdGVuUDl
	hayvM0hh647gGVBPPqdeoNpib9QgFqkwOcWP/Zd200yc7KLxxxHuTRGyvQEjExJIR/6ov0Iz5sE
	4uD18+x/26NF8ebpMbVKKUJuOMPZfck8jMROnXODyxED8BhaVtFuSsmuo0I6OuRQfR4EKRsYYVN
	JajTS6oPxiaYma/yc8Bb20CerMi3EOWXGgUTWiVMlwITKTUX+PIJ3WHfpcgTc6AWuomLo9HBfcN
	MgchwCN2yQt7l9aeNp8p5LipYzvfP37J7BAqviYQaS+UbyMg==
X-Received: by 2002:ac8:5988:0:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-50e367967e3mr442519871cf.32.1777116226888;
        Sat, 25 Apr 2026 04:23:46 -0700 (PDT)
X-Received: by 2002:ac8:5988:0:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-50e367967e3mr442519461cf.32.1777116226424;
        Sat, 25 Apr 2026 04:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41abceab0sm6416323e87.61.2026.04.25.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:23:44 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:23:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Lukas Timmermann <linux@timmermann.space>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 2/5] drm/panel-edp: Add support for Samsung
 LTL101DL02-002 panel
Message-ID: <ughwlscd4iksf45rdxwcoavtzpusslu4afphfp5gr5rrrmdtu5@7eu65pg7hp2p>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
 <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69eca443 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bsQV_sbQVq-5e8UBBKAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: __VRkdIQEzm-2l0gNCSoKLnAnRB7qMkN
X-Proofpoint-GUID: __VRkdIQEzm-2l0gNCSoKLnAnRB7qMkN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMyBTYWx0ZWRfXwH4OhKtxyE5k
 1uJFoh6WusCrtk0fwAksdJ9EzyOpVmMoacjFcVX0xRdyy66du2E2DLUw6qauyVehdVpzcGixjIK
 eqEEKueQ/KEJgkz8YZveaMZYbWHzZOBT42vhh/wcGPei0NXJhLGZP1OZIJ1YxJ5Lt2tAVcWzMK2
 mviGgyaErQ8WxOITbQe3bcbauluVXdmBc1n6CxJN7f/Yj1hXJ5i13OHI4Aw9DcBsBoLuU46t7L7
 nMEgUuK4fZljzU3UZT+5qAyR2Jm3WkekZNrD0ijKxyH6KtaoO4sHZ/ss8CUrp2GH8Z4pw3PMEIL
 IiWRTbrsMPyjQ2B1e1rIHYjIj/s39tVUHUYP1JT4RFVmxjh+QzDSR4NsMt9Lc6qjVEOUvknSZlK
 jHPRNGDU0lL3Td/rq2Lt77vaLGcP/gwImW2lhgwkiOCxbaVLxInueqCApHTVZM7CIvtOXg6V6Hg
 ni2iFWGxYXZ1Zhs3JWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250113

On Thu, Apr 23, 2026 at 02:49:53PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 23, 2026 at 2:15 PM Lukas Timmermann <linux@timmermann.space> wrote:
> >
> > From: Alexandre Marquet <tb@a-marquet.fr>
> >
> > Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
> > Samsung Manta (Google Nexus 10).
> >
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> 
> Adding new panels like this is discouraged these days. Is there a
> reason you can't use the generic "edp-panel" compatible? I know that
> the exynos5 driver is pretty old, but a quick glance shows that it's
> based on the same analogix-dp core that "rockchip,analogix-dp" is, and
> that seems to have support for aux-bus...

I'd also prefer to NAK this change. If the driver can't cope with the
"edp-panel", the driver must be modified rather than pushing more and
more legacy panel compatibile strings.

-- 
With best wishes
Dmitry
