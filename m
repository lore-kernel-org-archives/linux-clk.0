Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467F9460;
	Wed,  4 Feb 2026 05:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770183443; cv=none; b=bNiizTqo/DlpOR4rnom9nETcMcXdz2fpRwTza9boJCZhB0lgawYnsKroTLoG5ioco8sqAR4Eo/LEa55fpnNXBUT6+oQOR8zrrf5qofIwtK0tQr88aJPo2VX5ygspzgkAqtUlVmk+FVMacegVyYEVr4spSstL5aDQWmprH0KuagI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770183443; c=relaxed/simple;
	bh=DdUNyXOvujvhPt+hXHM1uvHJZ3UgKsPIS+vRCXku+ig=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=dVjdEukkWEuV3zRcwRw+Wvr9VDlo3oObRgYHHAmFQqlD9IlvZNnvBnRLr5/UtXO67ZPDllTh9OEmnr0DMznPp/ZcqDjesezMO/HexZ47JTlrtpVExP6IcEleMSjTNT9sXIYIbpBFyw0IqzZtt7zFrzkZCNdKUIRKpbDgVURBW8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxsq36n5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxsq36n5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABFDC4CEF7;
	Wed,  4 Feb 2026 05:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770183443;
	bh=DdUNyXOvujvhPt+hXHM1uvHJZ3UgKsPIS+vRCXku+ig=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=fxsq36n5ccJTll8D2V0Z1aqU012l7/JwvLvNMdXjDncIAAJmX0c63uLJ0FZYN3Yo0
	 +1CnSRlBLRuOX7xqgsmeN3zEjP9G8KdIzuWXhbnazgqYW5fwKr1+k7NcDRcQ6Brp2G
	 shMYb2y5roWPQdmBQMg8jttozAnyMQ3EvJZbYH0pzRQ5VMtMReZKnqluivJ2Or1A9b
	 1bHovcbErXdOwzoSIv5Snct+ryaf920nis7CSGgFkcEivv1aw0vw0eFGqMTMaYml0j
	 XnkRutUDdS3rrhCS4sbOU9IplV6bNXYufT+A7CbaodtvgjhN70UbfAclUiAuqK7O3S
	 rCPAOtCNBnxzw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251003015845.2715538-3-jammy_huang@aspeedtech.com>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com> <20251003015845.2715538-3-jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v2 2/2] clk: aspeed: Add reset for HACE/VIDEO
From: Stephen Boyd <sboyd@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org
Date: Tue, 03 Feb 2026 21:37:21 -0800
Message-ID: <177018344119.4027.5055693146328954429@lazor>
User-Agent: alot/0.11

Quoting Jammy Huang (2025-10-02 18:58:45)
> Add mappings of reset per hw's definition.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---

Applied to clk-next
