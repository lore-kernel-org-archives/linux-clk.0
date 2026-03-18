Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B83BED29
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848406; cv=none; b=C5sRYiK+PCiprmpGqT20N2KdrHP58waGe/77HL0sR0EoRJK06ZHUhnXTRBAKneWuXCd4JmtsBsTbVPH1ha3haHffC5H7N3Wz3Fq2GbNd24zkhBMZvyKYTGD7TRyZr9cMGqFoDI+2OJwEW0Uk6YBmPDuW+jkwWZDLzxOa1bRt+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848406; c=relaxed/simple;
	bh=kXgPJubBBRMEAM7a00iwPDTnwE1WqVUydbhsabJSVBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dt3nwsr74iyOR32fgA+kwWUXNwsTzf8zIvnS5TgYdNF5rH15on6sC7sPhUUY3uz3KO6xG5qF6kDNu5HTy30cfjPpAYVGn4k1rdivmHCBUpxKsBBrgyGQl+1ImNbsJZsZsfYBM28M0XsZTdK7GA1YJUdNnBiB93+5oKQHEO/DrEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTy/Y/PI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kM+b9o5F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTy/Y/PI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kM+b9o5F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFXH372966324
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=; b=cTy/Y/PIlh+7bFqp
	FIrmo1qZ5qEsUdB2VmJnBdLzD2kLOJezYsUbkX/37bz2+iVUflOtSOBLHSiF48Sk
	sfB3BPxYNHezc90psZCgTpQzxFCwLdntTZ781JRv7KeZkPxzg9VV3bZSDB4P1Qy0
	k9291c1Q3Ziu6nBnH/Z7faQQYRJA+1GtXidiB2a2Deyf9PDJPw9T+dgAtgj8WbQ3
	2wg8CgOjOPbODF6G76wlv3yWiz8CjOOTrGHEhWu4p5UAK+dw4O4LVDyFKihVpC9V
	pJEwKdemRfCRqzqitNQ7C1PzZ+k+y0hGfugCKmnYs0XwcbcmzOtPA3srenURuuym
	ek4cLQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ek6bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 15:40:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso24087721cf.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848399; x=1774453199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=;
        b=kM+b9o5FjiVpNBT8dUHTcb96KfJkCH8T3uRXrQuDGMSjzjP4EprSh7ZwAxtmKjZJ1n
         TsvckOqIdBz0Rjb+3YepLkQGoFLO4xSMbOhBehLuxqBTQEGZv85MtYnJh6Ux8k8R7XDO
         dnGluxze0pujRC4V00iWlhsXyA11clRwkq7KbBhZdn8cbCYROAxQBxqqz8t7nPO4TBZt
         sXu3gvjKItrx7zIoAxfgKiQdqJSu8dQvmt0U/NydVZbv+dL9LPwdICwjhdsM3kF3/kCr
         dHu26X64jHixAXzS2g1gR6i66C4L7hrM2KJXGVm+Q7ECV8wmr0MsWueuvfAfsldqBqBw
         LIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848399; x=1774453199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIqoWgKmQyuYPfu/JHLpVodU4oDvKEbNfgj2XsNto0Q=;
        b=QgQznFzd6GTnnRJ5kThkPb8/zsWM58QZ6BrsiQxsGW3K5L8l8MUdkHtvlLw/+Ir94W
         Wgwd7GDoHIIbRjjt6YrEexDXTMjBgcz1aTaXgXjCY3/90Bh1B7zKNUWvxtW0GiC5RXyE
         0UUA/VGtB8/KBcQtgUIOirF55jjNahXqqugbgkRhq4sQqRNv7eDRF9VeV9VlRqKOzmU0
         9h/kBkDDd38vitXC2XsVT57WYMBk0M8lj6MihYMTHGnMImHp26TX/y3tFWF+aoEf9c3O
         1sAeXyKx0VqvfqJ/pfUTJkH++Yk4+UxH5r5IMmImt+7BOhyRMLG9b/NPt8BwU8d7iT5C
         JPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7jizQ3fmXzPb6ceVL6wDVE72UOm8UtgtbVvGizqJWfktoqOjeqTcfQ6SX/nOq2CNwvD0LDkJPPBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxckkuUVm9R6h0S53EHk4633GakUWepmlzFDKi7oFYfIKFiPS05
	UxeOIoTC3A4Fwibg+nPNxnoHUuT0Nn8OvNfFYjYmc91AdqOeLLMa2eeS+kaMZ9jTjElxp+VSbPG
	8RkA1lkNZC0wvPRoyTiheV2Bk6hptR7qY9cupewcQDD4IZWvSXY4Dw+Nqj6yVa28=
X-Gm-Gg: ATEYQzwBJDx7bsKg/RAkGEFFeRrKk8debC9MrRqIJtJXDcT9TQx+kZ0oisc2SbUhlsJ
	aAx0y4lyl71CHPuElooSZl38BE9GG5uRTlOHQt6/hsXAnoecxvBoLm7lxZZgZntYBEivYmVQxn8
	SK4ybHvDitr3dLzpe0z+X6IQRtlOSzXBjfSDohh4M+NSgr2O9FbUxiMuZUMim37UL0HgCHhq7xz
	jg/ODH7DwiLCKyMOUs51Qy0fU4uD2TY/K752YUvA0vfO+HgxFR0NA/4gmTxL7WXYBqHFC68iN13
	6hFrocpy9wfXnXkGBv53ycEufbw1IF86hC9sTXE/vwe5e2HLu70+QQ0LYZtz2vWySDPmxrHHE6s
	rqKmlPAe+O+jfa8quIpbxBXIW7GY=
X-Received: by 2002:ac8:5f8b:0:b0:509:3367:c992 with SMTP id d75a77b69052e-50b1477d2b1mr49860071cf.5.1773848399262;
        Wed, 18 Mar 2026 08:39:59 -0700 (PDT)
X-Received: by 2002:ac8:5f8b:0:b0:509:3367:c992 with SMTP id d75a77b69052e-50b1477d2b1mr49859731cf.5.1773848398744;
        Wed, 18 Mar 2026 08:39:58 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:39:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Date: Wed, 18 Mar 2026 17:39:33 +0200
Message-ID: <177384710706.3709943.4851926053225673193.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
References: <20260129095442.1646748-1-lukma@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69bac750 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=15QbF078PdIEimGHe8kA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX8VocFxWzU5V5
 h/Ww6cJ3JuC/HV+IY3c9EQlajR6xvWjTt6qm8/XOa5IaxvgpFS/JArntYfitHRSSql3FMg3JJZW
 +h4VTaMsI61DMaLApqNgzr7UwzGMr7iOfVI4rkpPj/Adgw5U7u0/IcmX2CVjvmG5Bwxmd+tLpXD
 o6rjBuJV6DOpy1s6hiD1cxCX8l7T10cFN6JODVv/O2fEfFm6args2K93JJRKOIUHWG/258cOcXW
 0BBMdS+zgC8fe5+z5mPskFPqJU2LLah2e9lD4dbTPx+qEYN2etQT1Qj+2QUzpDYu9U40J6EC8h9
 OZUbp+XdRNkVpw6TeE18T5BtNeuQgJKIT76T6lrlKrufNxU1Jst/I3W4Mp0pgpuT0yp2/BXXCqE
 f4mjQp2WFspbehUqC1ZtuIvEFp+7dGEOqXd6YmNmxK7BijvT5pDYtjKtNrmX5O1cc824eRd20O8
 YbeBFzYz9h6LusN/5fQ==
X-Proofpoint-GUID: EbosIX1DpD3fjfzHT-u4-6YMiIVJs2Bg
X-Proofpoint-ORIG-GUID: EbosIX1DpD3fjfzHT-u4-6YMiIVJs2Bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132


On Thu, 29 Jan 2026 10:54:38 +0100, Lukasz Majewski wrote:
> This patch series:
> - cleans up clocks' setup on vf610 by moving VF610_CLK_END define
>   to driver code
> - introduces support for several clocks required by MTIP switch IP block
> 
> Lukasz Majewski (4):
>   clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
>   dt-bindings: clock: vf610: Drop VF610_CLK_END define
>   dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
>   clk: vf610: Add support for the Ethernet switch clocks
> 
> [...]

Applied, thanks!

[1/4] clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
      commit: 2c53aa5878f9abe6975ca45591b8e3357794c0e4
[2/4] dt-bindings: clock: vf610: Drop VF610_CLK_END define
      commit: 216ad764f8d8c53b85cc74f6090f8d132772fec4
[3/4] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
      commit: 819bfc68251484bb9ba4b6cf91279a80c0fd7047
[4/4] clk: vf610: Add support for the Ethernet switch clocks
      commit: 5567730bd36614d8099d73520760c298e80e0fc5

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
