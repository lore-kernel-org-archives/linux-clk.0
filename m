Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336FD1E492D;
	Sun,  9 Aug 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786261327; cv=none; b=p+m2uSjYJANexbf8OWa2Dl/q27kBr/uoSN/fh1U4Cq/9wbyesGmbN7yFRQ+sxKPw2ndkOkO2toEWBrBs25KimxOMDgFM4IfjJTc40niYqGUrojV52BfZlxskJKJZHBlDJ5jSF7K8AbtHSMNc3T2JJD12SlCleWK0MnRXmjgv+bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786261327; c=relaxed/simple;
	bh=b13z1BQp+A4wvohJY6qb+Vk7IxT1A2JtapJ7LUSfiXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qS2XhbmKeY4oMNbtb+QM5pWJKd663+aas9XoETnUTHMzBDkBhbHxc5FL414LHvw6ZX6jI91U7g61WHGB8wpbofVupc9C4MxsbnKo1/oNMj365v7tNdgF+zsdnuhLcoN9FRB4N94nkLSQv8QrDav166IfeweazqM1YCwqW7EfkoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=fyIOwPb8; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="fyIOwPb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1786261323; x=1786866123;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=b13z1BQp+A4wvohJY6qb+Vk7IxT1A2JtapJ7LUSfiXs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fyIOwPb8qQnVO/omUjR9ZLltn5zD2b5TDPo+lGEWEKh2LpFc/vT/a60yKcscsUAu
	 SG06oE+XoV4/1kOuNFTR6AjTluYifiuc8gX1M5ezgqRsNqYyvovF/OQoEWnXjsaRH
	 HB80JnsWTJfYYKe5fG+i3/rRucXOkD6eRKWepFZ92MMKVNGhfln3T1LNQdojOAShA
	 69FIJ0v27uJ9o4eNivAwPESJePjJqL5/XUJvUAcnrtt9xSVAhiuSKpjNfN695bDTB
	 vJRsqQT2rtJCeYWCGUp4xyjl2IBRLEXUvAMEF+iDWtz/slW2qdft9SB71La/CU8fK
	 9KfKvpbDhRGtU1jvuQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mt6wz-1x8q6i3nPF-00xMo1; Sun, 09
 Aug 2026 09:28:10 +0200
Message-ID: <ae78a94b-4feb-4ef0-8f1a-71786a101ed7@oldschoolsolutions.biz>
Date: Sun, 9 Aug 2026 09:28:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Val Packett <val@packett.cool>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2BjJNVrz4XFnwJd/V7HuJABJZBpMXLf+6xBaN1lUxPDyi34rF2Q
 4shHNOqea7V5mBPoxmM9tUSlohrKQgZtZ1JjIJ8xy1XShVkQOx4cuIsqIfbbUefWdWTcWLp
 Iy8aaK44NRpsbbX94f4gFjnsCYv+weFLnuicNBdDNO6yJTPEoIJkFRHej3MUdg0rF95Xavk
 3OPHFKXwbvK8zYbRCqeag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cuDjrJ84Xcw=;PvUH3M2gdwM+JX7i8Ulpm5/JZEd
 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
 =

Hi there,

On 14.08.25 11:18, Stephan Gerhold wrote:
> Currently, the platform driver core always calls of_clk_set_defaults()
> before calling the driver probe() function. This will apply any
> "assigned-clock-parents" and "assigned-clock-rates" specified in the dev=
ice
> tree. However, in some situations, these defaults cannot be safely appli=
ed
> before the driver has performed some early initialization. Otherwise, th=
e
> clock operations might fail or the device could malfunction.
>
> This is the case for the DP/DSI controller on some Qualcomm platforms. W=
e
> use assigned-clock-parents there to bind the DP/DSI link clocks to the P=
HY,
> but this fails if the PHY is not already powered on. We often bypass thi=
s
> problem because the boot firmware already sets up the correct clock pare=
nt,
> but this is not always the case.

I have this case on the Lenovo Ideapad Slim5x 14Q8X9, on the HDMI port.=20
when booted without an active HDMI connected device and hotplugged=20
later, it produces these errors (and no display):


[=C2=A0 552.501910] [drm:dpu_encoder_phys_vid_wait_for_commit_done:545] [d=
pu=20
error]vblank timeout: 2021300
[=C2=A0 552.501927] [drm:dpu_kms_wait_for_commit_done:527] [dpu error]wait=
=20
for commit done returned -110
[=C2=A0 552.540863] [drm:dpu_encoder_frame_done_timeout:2731] [dpu=20
error]enc40 frame done timeout

When cold-plugged this works, and can be hot-plugged later.

Further investigation showed that the main link clock doesn't come up=20
regardless of what is done, unless it was initialized by the boot=20
firmware before. Applying this series (found by Val, thanks again)=20
solved this issue.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

> [...]

with best regards

Jens

