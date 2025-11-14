Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1F244664;
	Fri, 14 Nov 2025 03:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091371; cv=none; b=Hva47qrW7VURhnOqyYj3VNt5WfDiRPNbYbeOlBB6O1JDsTyrIzyYBnIgpGIei84+pv/fNb/HZSeGWZhV+GI90zRAgXsQ4b4799BtD4p1zO1KLQSBOmebf9uBQfJEfJwQ/nD9egLoRbxf7Hv6KBhe3xkxU5mQfgV5ZbaFA97B7yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091371; c=relaxed/simple;
	bh=r8TKIB45aMDi3ryZ+DZqTIm3kPWTh7/BSnelWP8mN3g=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=pVQQ7uHcqhg7ukPAjXv1jPvDiC8XmMFlHnlqI3i3LSj/9niIcnvdshfAuKWGJh1SW4oI6UZrtOBnMpRNskoFXkNq0Vz5bY006bIWLTMwuvWwive3POUPkxn/OZsecsXTa44GC5wjkuWtK294DGAoR/k/+PuIJ4+0uSof1qGpu4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nh2D/2r9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nh2D/2r9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1270BC2BC87;
	Fri, 14 Nov 2025 03:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763091371;
	bh=r8TKIB45aMDi3ryZ+DZqTIm3kPWTh7/BSnelWP8mN3g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Nh2D/2r9q0X5Yt72wb3vtGJxRBe7jbWsOJrjHSQjBxLxmPwiGiObkLys7w9r4YinH
	 iBLffmB6mPXZ1mW45/DmiVj1ck9asbKfHcWa0tSNrfQmkjSsAbkQIOixs6SutYMv8U
	 yUh2btWgHdbss9eEfBYMxCQODH6oFug5JzadwejI6Lapk113pnnrC2cJxzmnGpIUVw
	 Ej+eefYjIhfbSYut0c1YddMoHbVPzEkv1u0QGYUcJTST4uvFsXVtXc92WVzJJwMHym
	 6E7OKsy3Wm3pWLdzDowh8P+P1ugQQlFY9hDTDHDUImwx2uTtem+2ufIbnfOvX8JcEs
	 HALc4s4EORbng==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
References: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
Subject: Re: [PATCH v2] clk: spacemit: fix comment typo
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Encrow Thorne <jyc0019@gmail.com>
To: Encrow Thorne <jyc0019@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Yixun Lan <dlan@gentoo.org>
Date: Thu, 13 Nov 2025 18:20:02 -0800
Message-ID: <176308680236.11952.8317865187541221730@localhost.localdomain>
User-Agent: alot/0.11

Quoting Encrow Thorne (2025-11-11 07:50:09)
> Fix incorrect comment to match the filename.
>=20
> Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---

Applied to clk-next
