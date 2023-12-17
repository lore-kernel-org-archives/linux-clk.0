Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F449F72;
	Sun, 17 Dec 2023 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyePG17j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA323C433C7;
	Sun, 17 Dec 2023 22:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702851970;
	bh=LVD1mN7nsDynD340j0xVISho+ecXDRj2i691KC6VnEM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jyePG17jQijpomyR5k+HKFKfOlgKgmspCRBHAD7mAKSqyOJ9AU/Fqjvqfzy4tU+dG
	 Lw6GWpfCZihODxFsXa6+Wx9QfvxqFyIvecO6KiqnVDDvXLZKytherjoT9ilBOnE3F0
	 Hd77g30eC9PEkI8p4w0o6D3YhhdTEbiuRYPVd3xcWl4iWpev6FJfHJ5rnr3yxBdSdI
	 HB3ERccb0XHVorGD7oM9F7kHU01qkX/LuO9D3boDNazPAqhg3oPz+i6bHYqtl8iobR
	 waiQtLGN1aYoT+u9hhyII9mdlrzc9wvIuMRBBp0RPa1uBdDiXxTYzElhmOXBLFXiKQ
	 dxXwFvS3gfkgg==
Message-ID: <229a61bac6134574ea9669075b851176.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231128104348.16372-1-shubhrajyoti.datta@amd.com>
References: <20231128104348.16372-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v3] dt-bindings: Remove alt_ref from versal
From: Stephen Boyd <sboyd@kernel.org>
Cc: git@amd.com, mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, michal.simek@amd.com
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Sun, 17 Dec 2023 14:26:07 -0800
User-Agent: alot/0.10

Quoting Shubhrajyoti Datta (2023-11-28 02:43:48)
> The alt_ref is present only in Versal-net devices.
> Other versal devices do not have it. So remove alt_ref
> for versal.
>=20
> Fixes: 352546805a44 ("dt-bindings: clock: Add bindings for versal clock d=
river")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>=20
> ---

Applied to clk-next
