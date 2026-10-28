Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182981;
	b=apAQ2U2eOijKQ4ZMs/KMi6MbTwDaCir6E9F1OsrPcHiP/AW+mi1PJHZxCpaCfjrbv+z3
	 Nj1Oif8gXCyro4imwKvzoWW/onM6yE6+v18cW9O1neV/x7lcuo0inR/tDjHMnqU1RJEvQ
	 dTKv1Qll0bHV/Vdy+/LkekHfHgM+qb6q1C4xYkUoK8c6mx6/fCbYP2JvGdfQFPF2LffCO
	 5sNwdB+sC4GvQphQ0L+FgcLBElEuEnpiR838sZ8j29zNlKKqfHpjEqnV2v0nxDU1e3KPj
	 8Mqc0zPE3TEUKHXQMtI9fBJWUmrEynzhpDE+ohrzRTmIL35HoQYrYf8X4W1bArMlVbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
	b=uufFzbaE+uHFUkg9k2YmzRJBa0GOGw+yPcfc+H/T+JwCA8XxOhiXMtbnb1h07luRe6Xo
	 Oc1TXIx8drsU5hi66rnd8FTBQJYFSFarF8DoZv5+nW1MeD/Q46ozwLqj7jsoIlqAdXoug
	 GKTVX9VgVkYi5nYKyT2yeAE8Luk2OFjtwlz8nCsuUPtXmW6EEt2PCI/gHV6fLUWaPw1Mx
	 mrpuMI2QQifbZ6HEGkRRZtMMV4O0bey54Sh8moK30AJ5CnPR6xiodsitCTQJ11RXB1tsl
	 UIVgb7FhtMNjCcM+zjaQ4WFvSw0oN56WbCMCPgdX9sCs89j39EIw6D9Vg9Gb0FurEKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqJ49b6j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEelwyrf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85363606A31C
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85363606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqJ49b6j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEelwyrf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K9LI253430
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 10:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=; b=UqJ49b6jcBEGRk4N
	SMcg+4URhJJuhk3SeW8bv8F4v6ep04YNfItmRsT7kGdv+WqjQJKm8XECwY4SMr0l
	Cw/OBTIt6b7DBmuLNZWP8tSDKfneEmZ9lmTLN4s83EFFQ2wUGYRQgdk3Qmsx/Sqw
	HmjX8jCJG8Ku0powhzuVEZgUKBbyf+LRYDEpuzykx0+rHBLgnExjTCzLMLuaB5Nr
	NXwXvgaq8a8hJvmaBjuRP02xX3M8WljiBZQ84/2smhW8KyRJ9piZfexGD740N+Dd
	l3uF0WZOQ6TPpfwjtKiQUeG2pXrZB6HgovunNh649Zgzo8MWX738zXTzSIzmSdhS
	B5MMcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be1yp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 10:22:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so121565485a.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182979; x=1793787779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=cEelwyrfGfmlt35tTqod9Uw9EXTfW+0PqqluJChECzfmxHszHmi524Yrh/sCXh9AxM
         sscjoDTAIjs8OQk7wTnXfZ7M5NlZeCrJpwDVRhAFMzml+X0uj2SZxOeeyS8lWbDlBZkd
         RjuhhLSANG4wmC+5ZN1LDpJPsaPpAmv8WKwEN6W4w9YRnv8fWmErGzyLGahakNw+u/6o
         VeqFM0/z0Xcrm2SHQhK4AuGpqs72lseYQJG8BQGDQ037Z11+GelEbTOBHx4Ehz8s0z6s
         6tRg2HpqWbzFXgAEFE4Fh8CyUp/GseaYCuDT8LtUzYpggWrPYOwhv/lxpukkZc3md7r4
         UJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182979; x=1793787779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=iGRfFpAgaG6VW90xe9uH+y+EwaJofB3frZE26MdwXtY4pdtSOf+8BSNqaLJoPQnm+z
         2FakjrJD2ou23yLAh5577yVTM5DxmhOFceAjQlOeGMal2q9oZp39Qa7XCSLERE01I/mu
         /6+0WlDftWoyhqHn4Ged19t2iVkFPGpdVdtHnJXsY1NJMnVEyK4knEpzMLPToS/HVAdq
         VVNjTupDVOQcDzGGGxkWr+qC8smCGG97GuSwQxt647EjREgWgWwcgoV+YRCXRdn8emTa
         gF2Id+ZpsW98Lk9ZD1ls0GlI6i2poYiD8OLTiYpT4yXtP6cid1IvjZhXJNJnX2T/G/At
         pZNg==
X-Forwarded-Encrypted: i=1; AKwUvBxQSs/OPh1zzmAaYvqK8NI6CrYTvpEL4tusHFOfqSQPYE67PXIoPtqS2AYJhUUozkbA9xg5joDRH84=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP5dXCIVqeoJnm+ffnBqB0Ka04gME+VzdH7XPw2Eo75+RdRdLB
	1gQsKsuBiTTQKUjydmV8y+9XVCxRbay5RyvCsbrPQ2srbpBqixOGtD+HnTyDYgbEuZhcxFCRqPc
	LMtSPBK/8KBf5ShgtWPHxnV7f11d5+RkZEwam4bYoPm4KAp0QoK2NgGxPX2bNSeQ=
X-Gm-Gg: AYBFou2Gx/+9ELGz83tow2NyfC+2cnWzObDmZYsRdZrC8jZtBzA+FUemRflXmZtMdVI
	6EcmNXhe+eWBFOoUlW5BP2s+KKcy/9idD2MbmzjkYcDdnb684raREQgWtmg5/h/6iO3crM4xNq+
	0fngICYFjbFSBXVhu4jxmz7B8DY9FIa2ZSbb/87GX4oSSAPqophlwQI5zFYU9JYJn63N65McUPX
	AfbaocO/rW+GudV/3YVz0De2mFlRAYGPEMEheCgGIhIOV0+l/FVeDRm3ejpdp6zlPEFAh4A04dh
	vF56fQsAnsqAakXd7rFiQtBRCaQQpbqXVZ8Tqi6juVHbinKRhj+x/aCyWMJzklESVo4nFJqK2s0
	VWovNjNi3MNzvNd5YhXO8b6CXKEfFN+XdG8+cHMEL2JcsZLJG0xJ5iLhnyfRQYo8vmjYWd1LZc+
	vc
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227996285a.60.1793182978660;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227994285a.60.1793182978265;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a976010ca7sm36225665e9.1.2026.10.28.03.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:22:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] arm64: renesas: r8a78000: Enable GPIO support
Date: Wed, 28 Oct 2026 11:22:55 +0100
Message-ID: <179318297302.16022.6984836476337905961.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792776697.git.geert+renesas@glider.be>
References: <cover.1792776697.git.geert+renesas@glider.be>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ym1d5Eyz2CW-T99Dzmdn7hcvrG1A022r
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1cd03 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0_pEspLTn5AsfqPZqEwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX3oCK4EhojVp9
 3RO7t+3tuJfwt6uTMP4ihJVjv++7U6RNXtmrm0wrOB2aKfV/q4VvYNPvoKIvdyhDVuuXHPyhQBL
 MAaJv9ymvW4WjGOyXZhVKhw9kllzQw0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX44d4PmYNIN5j
 fthYp9EeUR0Imf7addtJ2I60v+CS4Vf3AH7hRK5Ghf/t3d5DbJLF2Et3vFsQmrJZp/24aL1Xt4+
 dNpdX+mZRO6JgySN923pOZFs1ZNW+kB5HVVzpwHpOeOnU1GiLggI5PSIjBLJIRTFX1rVavicRrW
 lilEZIw4+gfXuJhXkYVqgrsKE7aWXRmnK0+Ry1gnIiFyXhwBKb81d6oYShoJMlf0tDl1q8JtbfN
 DtGkAQi6OaD6FbjPxlz+x1mB2bPwMwOV9RTcthC2KoNHCT0iVHxEjIpXdCS8Sx7gJu9mGGHAgnM
 D5HLIQAawPOYdpECqmjpfgQrvndODwRwtuCwUnNkOBGCaHylSEFBbNW3D+rc3SAS0i6YWmgsba4
 gXSJ48QXxEzNLJGax/IHm5a7MTOKFsBpKmYjjp4iUwQZwP8GFVBbf6Pn8I/F2EzmhmmrlavCR2j
 eF9gYZVQcI25p+3517g==
X-Proofpoint-GUID: ym1d5Eyz2CW-T99Dzmdn7hcvrG1A022r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280041


On Fri, 23 Oct 2026 19:50:38 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series enables GPIO support for the Renesas R-Car X5H SoC, as
> found on the Renesas Ironhide development board.  On this board, clocks,
> power-domains, and resets must be accessed only through SCMI firmware.
> 
> The series is a bit special, in that most patches are not meant to be
> applied upstream yet:
>   1. The first patch, targeting the GPIO tree, restores the abily to use
>      the R-Car GPIO driver on a system that does not have pin control
>      support yet (pin control is not yet supported by SCMI on Ironhide),
>   2. The second patch, targeting a shared DT bindings branch, adds GPIO
>      clock definitions,
>   3. The third patch, targeting renesas-devel, adds GPIO device nodes to
>      the R-Car X5H .dtsi file,
>   4. The remaining patches are marked RFC or DNI; the latter depend on
>      code or DTS that is not yet upstream.  More detail can be found in
>      the individual patches.
> 
> [...]

Applied, thanks!

[1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
      https://git.kernel.org/brgl/c/5e826d71d4839d8471784d968274823f1f492eb5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
