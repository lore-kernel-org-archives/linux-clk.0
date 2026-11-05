Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904043;
	b=tia/WcoUVqZyUJKxJHH6A6V143IU9DC1VBKE+emaG6ZmnLUmW9DXUB9GwKOETEKmqDCy
	 P8RWiXoM3zF23hlyRfpnla0xbQdZ3O4Jo2TsNMhMnsE68OY7enqGVzaRh3dneovBDnI1a
	 IZ6NZpI6PbFhXJ+cER/SyF1unYr4j4l9g4k0FZ6Apxeplnm7sTixzw3F9rzD0cG4SQZsY
	 ZPSXajqffzni3nV9LwePdGAOqULheP1yp/cHZA0jht/fIJC5rt083ev9gy8KFo7yR8KGQ
	 ShuQboCKbi+CxkEWts3Mn6DYZs6GVi3tUBrzpJTqP3c4ZnSWjEobyOOHOExR3KIIJ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904043;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=mrPZKSww78CDEYriyViFtkzmvPXUmkfVcHviTAAFbSE=;
	b=aC4GamOAfIQC+jSSNoSZ0dfXPLjc5DqPbF8nOVqniHGT6vBMUkly2GuDfYvMikwwHMSV
	 0PO+N0utNwvrWMc+srkbAmB8mXJggCqt6w/UHG7ooag4D6GvtLDINdlEca/KW3TbOO0O0
	 f7OPO4KrNh2Kpu2pGJlH1pBTXv9iwAT/iujZin1vHqbpPU2ByrQvXcr2zHiEwdFg7dNlY
	 QzVtbUJ553sKY4sw+4dNs5Q5AV203uj6A7ZlFxIT3vwBQP2vIJ0z4iLA7vi4xlwMxEnBN
	 0hALtSEOZmYS+C5Ae/loPltDwG8uwZ+AIsWQpxAoTettatsqqX+i54KG56YVraZljlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIco+KWB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C47606D810;
	Thu,  5 Nov 2026 18:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIco+KWB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8013F1F000C1;
	Thu,  5 Nov 2026 18:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904042;
	bh=mrPZKSww78CDEYriyViFtkzmvPXUmkfVcHviTAAFbSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mIco+KWBQtZn/2+Ylet//LqsWczzhlOZomRiI2LpIHZJJ6GPSbMN3VrA+4GsWiOjP
	 DTefVeYO+vOt0oX7+UKiHR7UPvDyVn2j0VLV+cr0nqT0kANak0XZ+F9J1oeBqzFzW7
	 AD5l3l2XONsnJes0BuTj0msmUcsGwo13np2CjNSsjgs2Rn4bP0rx9ODyXjQZOSNSqS
	 n+uP8CanP5yBNA5mu58RK9qyc9D0p9vmrFSmdKSHROFRIAw4Uiq0NfHZQL0A3PqiBI
	 mDD2EvsYBb1gG6r7daXML1EoXyXhcVejztiSvtd6e6s2QJyJSjY6kXbYMZgQB+9R3r
	 RwFLIkJ1GbdeA==
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	domibel@debian.org,
	panchuang@vivo.com,
	trivial@kernel.org
Subject: Re: [PATCH] cache: sifive: Add bounds check for interrupt count in probe
Date: Thu,  5 Nov 2026 18:39:45 +0000
Message-ID: <179390394386.1477457.13551015598281475758.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029064137.569-1-zhangjiao2@cmss.chinamobile.com>
References: <20261029064137.569-1-zhangjiao2@cmss.chinamobile.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=782; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=N1v/Z75LuaIRQEGlixlkdCi8GYwdg/qEI2roVFh8XyQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuZy7Jiw8uljAwkdKW3Vj6vCfe5t37uTW+J0prt2t meQ5tbpHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIuSPDHz6Or7yVIfd8vWTZ vtgqMz7YV/JFpGzz8lKpE6sj5jd9W8HwT9PFy28Rr4Dw3q9OAYafni5cyLOYVTxjyszLXYxBLVK KDAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 29 Oct 2026 14:41:36 +0800, zhangjiao2 wrote:
> The sifive_ccache_probe() function uses platform_irq_count() to
> determine the number of interrupts and then iterates over them,
> storing each IRQ number into the global g_irq[] array which has
> a fixed size of SIFIVE_CCACHE_MAX_ECCINTR (4).
> 
> If the device tree defines more than 4 interrupts for the cache
> controller, the loop writes past the end of g_irq[], causing a
> buffer overflow in kernel BSS memory. This could corrupt adjacent
> global variables and potentially be exploited for privilege
> escalation.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] cache: sifive: Add bounds check for interrupt count in probe
      https://git.kernel.org/conor/c/56ca3e2f00b6

Thanks,
Conor.
