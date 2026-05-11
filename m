Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0983D88F6
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496858; cv=none; b=DF7qXYpPUNF2Cpqo9upu2wnXliZ4z5IZ7A8ILL79aAO3rie9f4ZeU/TMpnG0nxIvCtegwEn8OnRMysY8+EOja4Tqq6M6ua5nPaiW7Nrz6gbWP7VPFai9Bxs829XS/+1DDqbdyYFO72LloMAfVRlF/SfxhKePHWh6R/RL5tVd5RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496858; c=relaxed/simple;
	bh=Zq7nyiYGo8t0zBejjFLX6ASDrvhoqFDT/D1FMrri0Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYiVXSuoOdCNFaA500CBU6EnxUm4Y+08mjpt1u7/1v7c3BN7D5mAi7nGATOMekrvVJCmRNXUzpR6Gb4XYFniZaDZe2JVgGbqIozoXeshgXshuiNs7CHzIgsYXMDnuthfZX+z5Ef7HOgcZgfEZFAGl9HsheTXvf9CHyIhZR9R4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8QJ4sdY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YO4Tdzl+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8QJ4sdY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YO4Tdzl+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9Gjc3653525
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 10:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxocFjuN0LOAjgweyXXNhrSSGQgx5Dl/pI1l7dwYsLM=; b=Y8QJ4sdYNG0tl2UK
	FU5oRfpx5ApMhP51wQBqVYIbKTTM092/F3DjkkOuL2oHZIBJQZOurdFmp3QH/bFq
	MeiCPDLJm6SFj11z83N3FLu6bAtw+S7dT9IRRUvNd4ykev7mi2jZWCnq+WDBvPxa
	mFwYC62zKehdxRWWao/gN9Dj717eZ5yIl5iBk4Yz634tsXY3PYIGO4TLCC2s2XJk
	Id51kKYCKXPk2HSwRIWOcXC+6JRUCRWXPyMmGbzYuwLiLO716635fpa/RAKDfSOs
	RuwZmSlNpr2m+GDXRE05L37UMX0aY7l2b9TPy4HIaNG3xiK4F11o731NjZ7JQXHp
	uU8eFw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu9c60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 10:54:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63136c0b6fbso4204504137.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778496855; x=1779101655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxocFjuN0LOAjgweyXXNhrSSGQgx5Dl/pI1l7dwYsLM=;
        b=YO4Tdzl+xskawoT4reUIaV2qqymd6TpT6Z7Hqa77lP9hNPmc6Dv1CUATsekVnPp2AM
         cAkhMK53LhNCMXWSwsRJ+bpjr/McB6AuDeiXyHfsle/B8adZCrEIVQXgJ0h28leDeWSi
         lr7vHXrRlqs7n35fhA4AF/MfES2DVytgbe/6x/57n9o3sexk+Y+IqhY7nVPYICVr4NnL
         qXAi4Xm+j9JmYgsocDa2tlM6ZewjxbD/ehuCty7IvFe76copqBsJOkJR+FCt0HbNSr8n
         gK0v3x2/jvi6pe082OqJrfdhobC+QPEMHhQ9CUwMb3Y9rHSW3N85hs61n2SI9QE2XNmz
         zqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496855; x=1779101655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TxocFjuN0LOAjgweyXXNhrSSGQgx5Dl/pI1l7dwYsLM=;
        b=hQ9ObCr8hVkYpUSvrGS1K3fDPtSyA7o0Fv7lqisQhmR0tHNuGioqCXoiphEU21YZbu
         2itqUsKu8e1WTkcbHHrm8hLLpPwvBMbfcz1sTlvaHpG8++c0TUZekHtPg1aHInzttCIR
         Pgn0/2eA5/1RQ+ZGMUgd05IxRe3HA1PYDgVb3Z9UUzV+2N9WNqbvjypAgsE2c1JdjVgz
         NAhcl2p5qH45yQBWK/AdDPZFyrDuBhnuu2z0uBNiOzUVmaSXkHANq+ERpm7JoYcdnetz
         ndX/ijPx8NfYmiRzbibmnDfbIor67VsH/FhOeaqELzKo1y+Q2ard1oGPSkN7UV/uxcVk
         uvUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LCcmR+kxQvu8oBTpcm22y5l3zrqC1r0zkf51/B6w0ZAwTTRxM2MIixl/zU8fVrXAXCO+ecg6F3dw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1D63nZZlO2KuWQCZOh/5404OZJiLEFJ2L7FpBh3xa63BsZNx
	vYL41JpecsK0YFv3U5AbsFhmDV4zkfitW7fWxvxoNxjFy/wb7z+LJ/M/OJtnlslDeD/x+NywnGx
	fbhttiAAO84McQ3r6Zu6rlFVYQL0ZVCuM44oRc30sXdmzGcx5uxINgmbVpgTAxUg=
X-Gm-Gg: Acq92OF3inZ7zx79yFJKi0MPgKuP/9gNnJkh4bPrIynzzpdPowLIaCIma8PI94nR4gZ
	nG1uSWnvPdMBhbSXqZIghIsvMQc5BwEdQU8avpy1yTBKBINImtWElG12zkJjFCECIxF+KWHIpxb
	eFyGlcJfDzcyHmn2qus3NpL0Iy9z1HlkGDTp5za/OJkchtagQZHYvK+tHfWDMD7nKKBr2GAK54H
	CpwIkOENe107nFw2HI4suZbGl6wLSKUNVzRQxU2DR/F/OOHaVV55TCvG+EzOBuvHdwzlRDgLoqx
	S5drRT8HaehaeQgK7x2DoOWWCWbPC0dhZrZItSdbft0MKn+GZ6a4yFe65STDOjcJMumhPhnGk6X
	w08WsR3fCe+/jf4TS82PWsmSYxD6tSn0toSGxRd9feQ8O0M4oUQ==
X-Received: by 2002:a05:6102:5e98:b0:634:92c:bdcd with SMTP id ada2fe7eead31-634092cc426mr1122833137.1.1778496854858;
        Mon, 11 May 2026 03:54:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5e98:b0:634:92c:bdcd with SMTP id ada2fe7eead31-634092cc426mr1122814137.1.1778496854416;
        Mon, 11 May 2026 03:54:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcca389b209sm299738866b.16.2026.05.11.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:54:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Jisheng Zhang <jszhang@kernel.org>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
        Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: (subset) [PATCH 00/12] Add TH1520 USB support
Date: Mon, 11 May 2026 12:54:10 +0200
Message-ID: <177849684249.46127.338857521767724625.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a01b557 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ij283RjCuas_M8ejfCoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMCBTYWx0ZWRfXwdhWtbWqOgYh
 5ErBuNrpzO1foxsOyCmD9ckyecOG/FJSu8TBWjQ72IiyzPWGSxr/O9IP4Lt4nh7tFbWYMq0PoNz
 4NKY93wOZqg4c7Kz+HmsDk2/i/FJmywqHJZ3HWtMVvg19mAuWtPU2FEWo5zjDkFYfmnS+pvZ87Q
 qICnFuQ2Y1/6XjnqR3HAmPXKEICNxRNcyIN8aYeEboEuIInVVhnAh0NGx9rwVGrSzZrZiOUkbZB
 yEVUw751loTR932qJhFQekl2arzZtTTYAXx6Y6MWChIZv5r8/z6jaUNlq2mmNUtuyJB1vR3DllV
 7KG4rZACZP/JnGklmX56mZPY2/2+DHsdK7bYMoJ/lHHErCAwVtflniH6s82MPgYBr/fNLwA1ONa
 n1pdWVPBlBLoANpCRpdn6DANU5neIY9wbhbhXc2jqA455kCA+BBa/GXbrfsHKVPRE9nv1gSDw1O
 5Ue5I2xMhjLnJ32KEvw==
X-Proofpoint-ORIG-GUID: qeuNXGX-LV7nV7GkqzPAyOrHpikA2YoI
X-Proofpoint-GUID: qeuNXGX-LV7nV7GkqzPAyOrHpikA2YoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110120


On Thu, 07 May 2026 16:16:58 +0800, Icenowy Zheng wrote:
> This patchset adds support for T-Head TH1520's USB functionality, and
> enabled it on the Lichee Pi 4A board.
> 
> The first 3 patches add support for the MISC subsystem clock
> contrtoller, which contains some USB clocks.
> 
> The next 2 patches add support for the USB PHY of T-Head TH1520, which
> is a wrapped Synopsys USB3.0 FemtoPHY with a little integration quirk;
> the controller itself is a properly configured DWC3 controller with sane
> default register values set.
> 
> [...]

Applied, thanks!

[07/12] dt-bindings: gpio: dwapb: allow GPIO hogs
        https://git.kernel.org/brgl/c/f76c8be440e53465a306c95a7d50ca8675252f82

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
