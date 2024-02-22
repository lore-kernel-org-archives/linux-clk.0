Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112B175AB
	for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2024 04:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708575661; cv=none; b=QQpsvZqScTy572P9wn3TklPuCuKFfml/Lmtg4KYLqrOHdMQ5mcBbVPUZH8V0/aVQ0kTfUL4Lao0VHai6OhainxQHAx5c3Xn7AvBXO3Wz4NL2jnlkVJmnynCMrJ3UI2dLvXzMkA0DG/lqUE6th+lt5T3uKVEIDN+SJFpGgPYTRgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708575661; c=relaxed/simple;
	bh=WN3J+P5pkAS0XvtCyVvlPdYBu5NjIdTkYPGV2i+XYvg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Vrud5D/YsNg5nyVAhU4SjxvYMOGrwR78l2TlizH3+RElmOqE2/+olp5BY9yqmcNiliUW9XNN9yqehSN7Gc3qNi+K8T1e76UcrimE5rPxTPODrogvU1Wus+C3zdKp8GVWiEcpuKCxGv/kqBRUhAH4zpCi4NA7F3fdlAuD+cMIhl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLC3DDho; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLC3DDho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E81C433F1;
	Thu, 22 Feb 2024 04:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708575661;
	bh=WN3J+P5pkAS0XvtCyVvlPdYBu5NjIdTkYPGV2i+XYvg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sLC3DDhozp5kOGk7998+iGNeYcsUztR766avLoXfv4x2Yx2MWfBRYMJ5vgAOPzTHZ
	 B5aHGzKQfhlEHyZSMKmz5o3lzkmv2uX9fUv8PhzRQEbefEDxFhBJ5DJiMGfEV+2dla
	 Cxu3zFtSu0yMkDTNN3YfoiUMo++O0ixZSmbubetm1RN5kIcpcEi4Eo4Gi/voNsE7Ol
	 u44OP98bu7dRr/OpxXu1HsAqZsBuA2VTQJTNoKbSloNKvxWIXydQXJP4btxtmEs3nj
	 0J4seSeEbVH1Lv4v6mpvPRppespkgYtN3Q7/IivXoM2U20qcxSNBf2aNN5h+uMtxoX
	 gCXPVpmabDgDg==
Message-ID: <c0f42391eee797f1e5e59173b0502017.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240201133841.qcerpmyo4xwc7zxu@volatile>
References: <20240131093434.55652-1-nsekhar@ti.com> <20240201133841.qcerpmyo4xwc7zxu@volatile>
Subject: Re: [PATCH] MAINTAINERS: drop Sekhar Nori
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, David Lechner <david@lechnology.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Sekhar Nori <nori.sekhar@gmail.com>, linux-clk@vger.kernel.org
To: Nishanth Menon <nm@ti.com>, Sekhar Nori <nsekhar@ti.com>
Date: Wed, 21 Feb 2024 20:20:58 -0800
User-Agent: alot/0.10

Quoting Nishanth Menon (2024-02-01 05:38:41)
> On 15:04-20240131, Sekhar Nori wrote:
> > My TI e-mail address will become inactive soon. Drop it.
> > Add an entry to CREDITS file for work done on TI DaVinci
> > family SoCs.
> >=20
> > Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> > ---

Applied to clk-next
