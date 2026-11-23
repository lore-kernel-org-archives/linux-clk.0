Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437736;
	b=m/gi+V1BhtKOdV4PSqpoHRc0tBRitIn/CER1BmoHzs9sqzzATH3kM7RYXH418CPWVp1h
	 o6IOodh1vrujIeFvaqMHBDj652+oY0SokhkhwqevYI1NB/fTsUzT7i6w1jFMgz+5pxby6
	 TUssPhY7assA957YwNGgNXixmFp9mE3LYqswEj+BwgUGx6MN/9n1JSh7oQgFW+tMtdlY8
	 h3TFWfuZl28zVavDG3+kSNNMk0NaX4YcrNkn9Blyi97xmZ8ERU4oXgCt7KlOFQircAn+n
	 2ZKO4rwJZIfZJAj6eBxVwNE3hhmilhiZjHPzEJV6SqVpxulX7RNFohAN5aXU3jsg5oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437736;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9I0udAh4k+IEtVLjhC08RI/5opG5srAmgJRwc2gLk+k=;
	b=3Yv78euJ0SitJiJwxmEboX/fFjTVVA14fnK1IRoHR0GqSVA4olcN2zfK9bSumJqFBAuk
	 yfqrL/H2eJEGpJfa09/PgZ36YT4B0GeUhI1m8n5N46q4ek0vrCu73ZyjpQwsM7Ient74l
	 K9d47z+aIptxNah+FXkMdD6D6ylKJ+TeuEL8ggmn+RSo5OkPqaN6NhSCI1aLqPja6gBkI
	 Mz+++yOFV7boUsWy2XiXzlIXQajSaayVf00SQy8sZ0gxsM7i5q6q5ZmfMfTEA+Q4OaU0W
	 AAm3BwE5VZxQVP72GAR6AXJ2cMGTfFR8iDd0NjfVxkRkGq6DbnHtDoAQMJnK0SwttHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZ5UFL3C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713B606A31E;
	Mon, 23 Nov 2026 12:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZ5UFL3C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A392B1F000C4;
	Mon, 23 Nov 2026 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437735;
	bh=9I0udAh4k+IEtVLjhC08RI/5opG5srAmgJRwc2gLk+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mZ5UFL3CfujsSi7zeXDN/Q/PlTdtNf8bjKy6u4C2YwuxcBfvwSCLdZ0jz+7SS/peT
	 1dtGHJHIEiIL7AreJx01YZjQjTuG7mpMBIjdUw3Kp582fjRFm7S/0Z3CR+JPfoeTd0
	 8+gMAtojUOXCasI0JXWqM4lRMxUDH+ca3Ytw0OrpzhAn/YMR7bCXKEEqdmaAKM08Ev
	 Ra3Jgiw2asSlY4LxtSNZwxxJGuppZA+lX7vIq3mucHT2Kgk7hsTy/rsUyyn1YXC0VK
	 sbzTf32Ai/MvZRGKkkh67Oc5PeSCBshKBiBn8bciWWkkGhK6YmD0xhK5w3zE7FMhYu
	 yvISB+qsWtN7A==
Message-ID: <sashiko-outbox-229240@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123123546.152162-2-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-2-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:42:15 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: qcom: gcc-msm8953: missing Fixes trailer in commit message
--

commit 59570529f8fc55fdf8adbdb3388beb1cf4e96df4
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

> clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
>
> The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with
> a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on
> MSM8953 platforms such as Xiaomi Mi A1 (tissot).
>
> Switch the 100 MHz parent to P_GPLL0 with a divider of 8 (800 MHz / 8 =3D
> 100 MHz), matching the 200 MHz and 266.67 MHz entries.
>
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>

[Severity: Low]
This fixes the 100 MHz entry in ftbl_csi_phytimer_clk_src introduced with
the driver.  Should the commit message include:

  Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for M=
SM8953")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123123546.1521=
62-1-hikmahgumelar@gmail.com?part=3D1
