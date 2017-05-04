Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 04 May 2017 22:07:47 +0800
In-Reply-To: <20170504140431.zhpcxvphxnxj7ipq@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-3-icenowy@aosc.io>
 <20170504140431.zhpcxvphxnxj7ipq@lukather>
MIME-Version: 1.0
Subject: Re: [PATCH v2 02/10] pinctrl: sunxi: add definitions for add A20 and
 R40 support to A10 driver
To: Maxime Ripard <maxime.ripard@free-electrons.com>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <318E9984-9F5A-41C3-A3E0-52D5ECA05212@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Cgrkuo4gMjAxN+W5tDXmnIg05pelIEdNVCswODowMCDkuIvljYgxMDowNDozMSwgTWF4aW1lIFJp
cGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+IOWGmeWIsDoKPk9uIFRodSwg
TWF5IDA0LCAyMDE3IGF0IDA5OjQ5OjU4UE0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4+
IEFsbHdpbm5lciBBMTAsIEEyMCBhbmQgUjQwIFNvQ3MgaGF2ZSBzaW1pbGFyIEdQSU8gbGF5b3V0
Lgo+PiAKPj4gQWRkIFNvQyBkZWZpbml0aW9ucyBpbiBwaW5jdHJsLXN1bnhpLmgsIGluIG9yZGVy
IHRvIG1lcmdlIEEyMCBzdXBwb3J0Cj4+IGludG8gQTEwIGRyaXZlciwgYW5kIGFkZCBSNDAgc3Vw
cG9ydCBpbnRvIGl0Lgo+Cj5XaGlsZSB5b3VyIGNvbW1pdCBsb2cgaXMgZ29vZCwgdGhlIGNvbW1p
dCB0aXRsZSBpcyBtaXNsZWFkaW5nIHNpbmNlCj55b3UncmUgbm90IGFkZGluZyBpdCB0byB0aGUg
QTEwIGRyaXZlci4gWW91IGp1c3QgYWRkaW5nIFNvQyBJRHMKPmRlZmluaXRpb25zCgpJcyAicGlu
Y3RybDogc3VueGk6IEFkZCBTb0MgSUQgZGVmaW5pdGlvbnMgZm9yIEExMCwgQTIwIGFuZCBSNDAg
U29DcyIgT0s/Cgo+Cj5NYXhpbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
