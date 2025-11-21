Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D252F617E;
	Fri, 21 Nov 2025 05:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763702452; cv=none; b=DQ3uIDYom/VKT0c1pdBqgpdWedkOv12hkxoGw14OFPH1jK5GPNcu7MJTIsMrLlq7qqnBcXsGGZS54n40y2vOKv51goYSC8jJiNdAJLontrC8Ame9wlL/Ft2xKEoOcrUsWayoYhRDLcL5BlJE53q1tKiX+8HhNusjXPIHNPBPLzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763702452; c=relaxed/simple;
	bh=i2FwM7GZO0cI1PqJuSMSgG5po4pWC/aYmRuf6oqJ0EA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OvcAxotsBJeMs2hKG3GmMc3vG/e5bxNEgQtubLdkAbJmyENmhXXQagzJ9car2wT5DYLQKAoJjKcv7r2dOE20EoDoYZAfwMBe1DqXP4GxLznlrmrX4lY1l2JRH/g8hGiEEF5FXPiwflVNV2Df83+/opGQY6CRd2eTM7DVBhty8D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAWS6/bi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAWS6/bi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A316C116D0;
	Fri, 21 Nov 2025 05:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702452;
	bh=i2FwM7GZO0cI1PqJuSMSgG5po4pWC/aYmRuf6oqJ0EA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iAWS6/biLVL0sAnADt6xnjlkSpp6FCgCoqn3Le5I/Sp+XgWVcbCdnjOa0zak6Ycfl
	 r2Jl9qZvnskxyMPHAdWNWDY+ERbRRATeNj59nwBMNnii6lvkclm1b8t7IY5cI+lGCr
	 dnpHJHp7aGjsFxBHEiTG61jP0y+G0VSq1kZFR13Jbftn3GJl+QVYlaAkETjuBojy3w
	 0uVIl3a0CkvzNJDWDo0qOAWVGxvR4tZ8tziBrINd82mlI47heZpAXAdzwZ+4E8KjKi
	 EwV6Kd15zzjOJWUr1aVL6j63RPN2HG5qyzojIYzs536DPAYNEBBbSyxz77DH3+PdyY
	 pta0BKLZyhR6w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp> <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: tmpv770x: Add VIIF clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 20 Nov 2025 18:57:00 -0800
Message-ID: <176369382052.11952.16022702616514274716@localhost.localdomain>
User-Agent: alot/0.11

Quoting Yuji Ishikawa (2025-11-13 23:05:11)
> Add clock and reset identifiers for the Video Input Interface.
> These identifiers support two instances: VIIF0 and VIIF1.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---

Applied to clk-next
